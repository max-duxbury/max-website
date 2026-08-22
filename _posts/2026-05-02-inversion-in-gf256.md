---
title: Inversion in GF(2^8)
date: 2026-05-02
project: aes
kind: note
tags: [mathematics/finite_fields]
---

TODO.

```python
def inverse(b, modulus=0x11B):
    """Multiplicative inverse in GF(2^8) via Fermat: b^254 == b^-1."""
    if b == 0:
        return 0  # 0 has no inverse; AES defines the S-box to map it to 0
    result = 1
    for _ in range(254):
        result = xtime_mul(result, b, modulus)
    return result
```
