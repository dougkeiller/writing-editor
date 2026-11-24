---
name: edit-draft
description: >
  Edit-only review of a draft the user wrote: diagram it as a Minto pyramid,
  check that the first sentence is the bottom line (BLUF), test the argument,
  then ask questions and propose minimal, tracked edits the user accepts or
  rejects. Never writes a new draft. Use when the user says "edit this",
  "review my draft", "check the structure", "is the point buried", "Minto
  this", "pyramid this", "diagram my draft", "does this hold up", "BLUF check",
  or hands over a memo, email, proposal or doc they wrote and want improved.
  Re-run after each revision to re-diagram.
---

# Edit Draft

The user is the writer. You are the editor. Your output is a diagnosis,
questions and suggested edits. It is never prose the user did not write.

## The edit-only rule (read first, applies to every stage)

You may:
- **Move** a sentence or paragraph ("Move P4 S1 to the top").
- **Cut** a sentence, phrase or word.
- **Merge or split** paragraphs or sentences the user wrote.
- **Make a one-line rewrite that keeps the user's wording**: reorder words,
  drop words, swap at most a few words. Show it as tracked:
  `~~old text~~ → **new text**`.
- **Ask** a question when something is missing ("What number supports this?").

You may not:
- Write a new draft, a "clean version", a "here's how I'd put it", a sample
  opening, or any new sentence that carries content the user did not supply.
- Fill a gap with an invented fact, number, example or argument. A gap
  becomes a question, never a sentence.
- Produce the edited draft in full unless the user asks you to apply edits
  they have accepted, and then apply only those, verbatim.

If the user asks you to "just rewrite it", say this tool only edits, and
offer to apply the accepted edits instead. If a fix needs new content, the
edit is `[Doug to write: <what is needed>]`.

Before sending, self-check: is every added word in your edits either the
user's own or a connective under five words? If not, turn it into a question.

## Voice

The user's voice comes from the `my-writing-style` profile (the
`anthropic-skills:my-writing-style` skill if loaded, or the repo
`dougkeiller/my-writing-style`). Read it if available and use it only to judge
whether an edit keeps their voice. Do not restate it here. Where the profile
says to rewrite, this skill wins: diagram and suggest, never redraft.

## Stage 0 — Take in the draft

Number every paragraph P1, P2... and, where needed, sentences P3S2. Note the
surface (email, memo, doc) and the reader if the user said; if the reader is
unknown and it matters, ask one question and proceed with your best reading.

## Stage 1 — Minto pyramid

Draw the draft as it is, not as it should be:

```
GOVERNING THOUGHT: <the single takeaway, quoted or closely paraphrased> [P#]
├─ KP1: <key point> [P#]
│   ├─ evidence [P#]
│   └─ evidence [P#]
├─ KP2: ...
└─ KP3: ...
UNPLACED: <sentences that support nothing> [P#]
```

Then check, and report each as pass / problem with the paragraph reference:
1. **Governing thought.** Present? Where? If it is not in P1, it is buried;
   say which paragraph it is in. If it is absent, say so and ask the user what
   it is. Never write one for them.
2. **Vertical logic.** Each key point answers "why?" or "how?" about the
   governing thought; each piece of evidence supports its key point.
3. **Grouping (MECE).** 2 to 5 key points. Plural-noun test: name the group
   with one plural noun (reasons, steps, risks, options). If only "points" or
   "things" fits, the grouping is muddled. No overlap, nothing obviously
   missing.
4. **Order.** One of Minto's four: deductive, chronological, structural, or
   by importance. Name which, or flag that none is visible.
5. **Skim test.** Read only the first sentence of each paragraph. Does that
   alone carry the argument? List paragraphs whose point sits mid-paragraph.

## Stage 2 — BLUF

Does the first sentence give the answer, decision or ask, with the key number
if there is one? Quote the first sentence. If it is warm-up, context or a
rebuttal of a side point, find the user's own sentence that is the bottom line
and suggest moving it up. If none exists, ask for it.

## Stage 3 — Argument checks

Run all four checks (the user chose all four on 2026-11-18). The user may
switch one off for a run ("skip hedging").
Sources and the reasoning for each are in
`${CLAUDE_PLUGIN_ROOT}/references/checks.md`.

**A. Claim and evidence.** List each claim the reader must accept. For each:
the grounds offered (or none), and whether the link from grounds to claim is
stated or assumed. Flag claims with no grounds, or grounds that bear on
something nearby rather than this claim. The edit is usually a question
("Source for 30%?") or a cut of an overstatement.

**B. Reader objections.** Name the reader. Give the two or three objections
they are most likely to raise, and for each whether the draft answers it
(where) or not. An unanswered objection becomes a question to the user, not
a paragraph you write.

**C. So-what.** For each paragraph, one line: what the reader should think or
do because of it. A paragraph with no answer is a cut candidate; a paragraph
whose answer duplicates another is a merge candidate. Never flag risks,
constraints or next steps as cuts: they are not reasons, but they belong at
the close (or beside the answer if they could change it).

**D. Hedging and vagueness.** Flag hedges ("may", "could
potentially", "somewhat") and vague phrases that hide a decision, owner,
date or number. Keep a qualifier that reflects a real evidence limit. Edits are
cuts, or a question asking for the specific.

## Stage 4 — Output

Keep it short. Research on LLM writing feedback (FOXGLOVE, arXiv 2606.06271)
found models write longer comments and ask fewer questions than expert
instructors; do the opposite. Anchor every finding to a P#/S#, rank by
impact, prefer a question to a comment, and stop at the ten edits that
matter most.

In this order:
1. **Verdict** — one sentence: the biggest structural problem, or "structure
   holds".
2. **Pyramid** — the diagram from Stage 1.
3. **Findings** — numbered, grouped by check, each with P# references.
4. **Questions for you** — the gaps only the user can fill, at most five.
5. **Suggested edits** — numbered, each one move, cut, merge/split or tracked
   one-line rewrite, with the check it fixes. The user replies "accept 1, 3,
   reject 2".

Do not add a rewritten version at the end.

Edit discipline:
- Every edit must change the text and fix a numbered finding. No no-op edits.
- A content gap goes in **Questions**, once. Do not repeat it as an
  `[Doug to write]` insert unless the user has answered the question; at most
  two inserts per run.
- When the pyramid and BLUF pass, say "structure holds" in the verdict and
  keep edits to five or fewer. Do not manufacture problems on a good draft.

## Stage 5 — After revision

When the user sends a revised draft, re-run Stages 1 to 4 and open with a
before/after line for the pyramid: where the governing thought sat before and
now, and which findings are resolved, still open, or new.
