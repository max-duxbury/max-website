---
title: AES from scratch
slug: aes
started: 2026-03-02
updated: 2026-06-11
status: active
summary: An exploration of an application of finite fields in cryptography.
tags: [cs/crypto, mathematics/finite_fields]
---

This project is an active Rust implementation of the Advanced Encryption Standard (AES). I undertook the project in Rust mainly as a learning opportunity, as everything seems to be written in Rust these days. The reason for this specific algorithm is that I was studying Galois theory, namely finite fields. I was struggling and wanted to ground my understanding in some real applications. Hence, I chose the Rijndael algorithm, the main cipher used in AES. The main writeup of this project and the accompanying notes (diversions) will go into the mathematics and the system design decisions that Daemen and Rijmen made.
