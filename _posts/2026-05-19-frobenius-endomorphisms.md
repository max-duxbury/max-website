---
title: Frobenius endomorphisms, and why squaring is linear
date: 2026-05-19
project: aes
kind: note
tags: [mathematics/finite_fields, cs/crypto]
---

TODO.

Over a field of characteristic 2, the binomial theorem collapses: every
cross term picks up a factor of 2 and vanishes. So squaring is additive,

$$(x + y)^2 = x^2 + y^2$$

which makes the Frobenius map $$\varphi(x) = x^2$$ a field homomorphism, and
on $$\mathbb{F}_{2^8}$$ it is $$\mathbb{F}_2$$-linear.
