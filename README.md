# Seattle.Rb Elixir Study Group

## Study Schedule

week | chapters	| pages	| comments
-----|----------|-------|---------
1	   | 1	      | 12	  | install elixir, github repo, mailing list
2	   | 2, 3, 4	| 20 |
3	| 5* | 10 |
4	| 6* | 18 |
5	| 7* | 14 |
6	| 8, 9 | 14 |
7	| 10* | 18 |
8	| 11, 12	| 24 |
9 | 13 | 34 | long homework in this chapter
10 | 14*, 15 | 22 |
11 | 16*, 17* | 24 |
12 | 18, 19 | 22 |
13 | 20*, 21 | 24 |
14 | 22*, 23 | 22 |
15 | A1, A1	| 18 | wrap-up

Starred chapters include the most important concepts that we should spend time on

Some options to shorten things:

* Combine weeks 3,4 (i.e. spend 2 rather than 3 weeks on ch 5-7)
* Combine weeks 6,7

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
