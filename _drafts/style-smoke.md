---
title: Style smoke test
tags: [meta]
---

A scratch page exercising every CSS rule. It lives in `_drafts/`, so it is
never built or published — `bundle exec jekyll serve --drafts` is the only way
to see it. Delete it whenever it stops being useful.

## Heading level two

Body text for comparison. On desktop this paragraph should be visibly *smaller*
than the heading above it — that was the defect. Inline maths like
$$\zeta(s) = \sum_{n=1}^{\infty} n^{-s}$$ sits in the line, and here is a
footnote reference.[^1]

### Heading level three

Still larger than body text, only just.

#### Heading level four

Same size as body, distinguished by weight.

## Display maths, deliberately too wide

$$\underbrace{a_0 x^{16} + a_1 x^{15} + a_2 x^{14} + a_3 x^{13} + a_4 x^{12} + a_5 x^{11} + a_6 x^{10} + a_7 x^9 + a_8 x^8 + a_9 x^7 + a_{10} x^6}_{\text{this must scroll inside its own box, not scroll the page}}$$

Narrow the window: the equation gets its own horizontal scrollbar and the page
body stays put.

## Theorem environments

> **Theorem 1.** Every finite field has prime-power order.
{: .theorem}

> **Definition.** A field is a commutative ring in which every nonzero element
> is a unit.
{: .definition}

> Let $$F$$ be finite with prime subfield $$\mathbb{F}_p$$. Then $$F$$ is a
> finite-dimensional $$\mathbb{F}_p$$-vector space, say of dimension $$n$$, so
> $$|F| = p^n$$.
{: .proof}

The proof should close with a tombstone on the right of its last line.

## Blockquote, for contrast

> An ordinary aside stays muted, with a grey rule rather than a coral one.

## Code

```rust
fn inverse(a: u8) -> u8 {
    // Fermat: a^(2^8 - 2) in GF(256)
    let mut r = 1u8;
    for _ in 0..254 { r = mul(r, a); }
    r
}
```

Inline `code` too.

## Table

| Operation | Cycles | Notes |
|---|---|---|
| SubBytes | 1204 | table lookup |
| MixColumns | 3310 | GF(256) multiply |
| AddRoundKey | 96 | XOR |

## Figure

<figure>
  <img src="/assets/og-image.png" alt="Placeholder — checks that images stay inside the column.">
  <figcaption>A caption, muted and one step down in size.</figcaption>
</figure>

## Lists

- First item
- Second item
  - Nested item

1. Ordered
2. Second

[^1]: The footnote body: smaller, muted, with a backlink arrow at the end.
