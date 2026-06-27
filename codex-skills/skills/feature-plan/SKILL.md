Given an approved feature:

Break it into the smallest mergeable slices.

Each slice must:

- compile
- name the test seam
- be independently reviewable
- leave the system in a working state

Prefer the fewest phases that still keep risk low.

Call out any interface boundary only where a test needs it.

Keep each PR as small as possible.
