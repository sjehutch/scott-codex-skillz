Change only what is necessary.

Avoid:
- refactors
- renames
- architecture changes
- dependency changes

Touch the fewest files possible.

Prefer the shared/root fix over patching one caller.

If you add logic, leave one runnable check behind.

Prefer interfaces at boundaries and for dependencies you need to fake in tests.

Do not create interfaces for one implementation just because it feels clean.

If an abstraction does not buy testability or replaceability, delete it.

After each slice, say what changed, what you validated, and whether to continue.

Validate:

- tests
- build
- lint

Return:

Files changed
Why
Validation
