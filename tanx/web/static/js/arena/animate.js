import ArenaRender from "web/static/js/arena/render"


const NUM_TIMESTAMPS = 10;
const INITIAL_BUFFER_LEN = 2;
const MAX_BUFFER_LEN = 6;
const TARGET_FPS_LO = 30;
const TARGET_FPS_HI = 50;
const MEASUREMENT_INTERVAL = 2000;



class ArenaAnimate {

  constructor(gameChannel, arenaSound) {
    this._gameChannel = gameChannel;
    this._arenaSound = arenaSound;
    this._arenaRender = null;
    this._frameBufferLength = INITIAL_BUFFER_LEN;
    this._receivedArena = null;
    this._receivedArenaCount = this._frameBufferLength;
    this._receivedFrame = false;
    this._fpsSum = 0;
    this._fpsCount = 0;
    this._fpsMeasurer = null;

    this._gameChannel.on("view_arena", arena => {
      this._receivedArenaCount++;
      if (this._arenaRender != null) {
        if (this._receivedFrame) {
          this._updateArena(arena);
        } else {
          this._receivedArena = arena;
        }
      }
    });
  }


  start(arenaStructure) {
    this._arenaRender = new ArenaRender(arenaStructure);
    this._timestamps = [];
    this._runAnimation();

    $('#tanx-framebuflen').text(this._frameBufferLength);

    this._fpsSum = 0;
    this._fpsCount = 0;
    this._fpsMeasurer = window.setInterval(() => {
      if (this._fpsCount > 0) {
        let avgFps = this._fpsSum / this._fpsCount;
        if (avgFps < TARGET_FPS_LO && this._frameBufferLength < MAX_BUFFER_LEN) {
          this._frameBufferLength++;
          this._receivedArenaCount++;
        } else if (avgFps > TARGET_FPS_HI && this._frameBufferLength > 1) {
          this._frameBufferLength--;
          this._receivedArenaCount--;
        }
        $('#tanx-framebuflen').text(this._frameBufferLength);
      }
      this._fpsCount = 0;
      this._fpsSum = 0;
    }, MEASUREMENT_INTERVAL);
  }


  stop() {
    this._arenaRender = null;
    if (this._fpsMeasurer != null) {
      window.clearInterval(this._fpsMeasurer);
      this._fpsMeasurer = null;
      this._fpsCount = 0;
      this._fpsSum = 0;
    }
  }


  _runAnimation() {
    this._receivedArena = null;
    this._receivedFrame = false;

    while (this._receivedArenaCount > 0) {
      this._gameChannel.push("view_arena", {});
      this._receivedArenaCount--;
    }

    window.requestAnimationFrame(ignore => {
      if (this._arenaRender != null) {
        if (this._receivedArena) {
          this._updateArena(this._receivedArena);
        } else {
          this._receivedFrame = true;
        }
      }
    })
  }


  _updateArena(arena) {
    // Render the frame
    if (this._arenaRender != null) {
      this._arenaRender.render(arena);
      this._arenaSound.play(arena);
    }

    $('#tanx-arena-json').text(JSON.stringify(arena, null, 4));

    // Update FPS indicator
    if (this._timestamps.push(Date.now()) > NUM_TIMESTAMPS) {
      this._timestamps.shift();
    }
    let len = this._timestamps.length - 1
    if (len > 0) {
      let fps = Math.round(1000 * len / (this._timestamps[len] - this._timestamps[0]));
      $('#tanx-fps').text(fps);
      this._fpsSum += fps;
      this._fpsCount++;
    }

    // Request next frame
    if (this._arenaRender != null) {
      this._runAnimation();
    }
  }

}


export default ArenaAnimate;
