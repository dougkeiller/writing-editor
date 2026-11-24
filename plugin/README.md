# Writing Editor

A Claude Code plugin that edits your draft without writing it for you. It diagrams the draft as a Minto pyramid, checks that the first sentence carries the bottom line, tests the argument, and returns a diagnosis, questions and numbered edits that you accept or reject. It never produces a new draft.

## Why edit-only

Most AI writing help rewrites. The result reads smoothly, but it is no longer yours, and the structural problem (a buried point, a muddled grouping, an unsupported claim) is often still there under better sentences. This plugin does the opposite: it shows you where the structure breaks, asks for what only you know, and limits itself to moves, cuts, merges and one-line tracked rewrites in your own words.

The output is deliberately short and question-heavy. A 2026 study of LLM writing feedback (FOXGLOVE, arXiv 2606.06271) found model feedback rated higher mainly because it was longer, and that models asked fewer questions than expert instructors. This editor anchors every comment to a paragraph or sentence and prefers a question to a comment.

## How to use it

Paste or point to a draft and say "edit this", "review my draft", "is the point buried" or "Minto this". Or call it by name: `/writing-editor:edit-draft`.

You get back, in order:

1. **Verdict:** one sentence naming the biggest structural problem, or "structure holds".
2. **Pyramid:** the draft drawn as it is, with paragraph references (P1, P3S2).
3. **Findings:** numbered and grouped by check.
4. **Questions for you:** at most five gaps only you can fill.
5. **Suggested edits:** numbered, each a move, cut, merge/split or tracked rewrite (`~~old~~ → **new**`).

Reply "accept 1, 3, reject 2" and it applies only those edits. Send the revised draft and it re-diagrams, showing what was fixed, what is still open and what is new. Ask it to "just rewrite it" and it declines and offers edits instead.

It runs only when you ask. If you keep a writing-style profile (for example a `my-writing-style` skill), the editor reads it to judge whether an edit keeps your voice. Inside an editor run, the edit-only rule takes precedence over any "rewrite" step in that profile.

## What it checks

| Check | Question it answers |
| --- | --- |
| Minto pyramid | Is there one governing thought, and where does it sit? Do 2 to 5 key points support it, in a deliberate order (deductive, chronological, structural or by importance), without overlap? Includes the plural-noun grouping test and a skim test on first sentences. |
| BLUF | Does the first sentence give the answer, decision or ask? |
| Claim and evidence | What does each claim rest on, and is the link stated or assumed? (Toulmin) |
| Reader objections | What will this reader push back on, and does the draft answer it? |
| So-what | What should the reader think or do because of each paragraph? Risks and next steps are never cut. |
| Hedging and vagueness | Which hedges hide a decision, owner, date or number? Qualifiers that reflect a real evidence limit stay. |

All four argument checks run by default; switch one off for a run ("skip hedging"). Sources for each check, and what was considered and left out, are in [`references/checks.md`](references/checks.md).

## Install

```bash
claude plugin marketplace add dougkeiller/writing-editor
claude plugin install writing-editor@writing-editor
```

## Golden set

`golden/` holds four sample drafts with known problems (buried point, muddled grouping, clean, weak evidence) and a "just rewrite it" request. `expected.md` lists the catches each must produce, and `run.sh` runs them headless and writes reports to `reports/` (not committed). Results from the first run are in `golden/results-2026-11-18.md`.

Run it from the plugin folder:

```bash
bash golden/run.sh
```

## Status

Version 0.1.0. Tested on Sonnet in Claude Code: all five golden cases pass. Not yet tested: the re-diagram step after a revision, Opus, and claude.ai.

## License

MIT. See [LICENSE](LICENSE).
