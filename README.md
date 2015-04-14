# Seattle.Rb Elixir Study Group

[![Join the chat at https://gitter.im/SeaRbSg/elixir](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/SeaRbSg/elixir?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Study Schedule

week | chapters   | pages | comments
-----|------------|-------|---------
3/2  | 1          | 12    | install elixir, github repo, mailing list
3/9  | 2, 3, 4    | 20    |
3/16 | 5\*        | 10    |
3/23 | 6\*        | 18    |
3/30 | 7\*        | 14    |
4/6  | 8, 9, 10\* | 32    |
4/13 | 11, 12     | 24    |
4/20 | 13         | 34    | no meetup this week, long homework in this chapter.
4/27 | 13 cont.   | -     |
5/4  | 14\*, 15   | 22    |
5/11 | 16\*, 17\* | 24    |
5/18 | 18, 19     | 22    |
5/25 | 20\*, 21   | 24    |
6/1  | 22\*, 23   | 22    |
6/8  | A1, A2     | 18    | wrap-up

Starred chapters include the most important concepts that we should spend time on

## Rebase, Don't Merge

Please put this in your `~/.gitconfig` (or `.git/config` local to your
cloned repo if you don't want to set it globally) to avoid creating
merge commits on top of others work:

```
[branch]
	autosetuprebase = always
[pull]
	rebase = preserve
```
