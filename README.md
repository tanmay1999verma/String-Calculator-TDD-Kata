# String Calculator TDD Kata (Ruby + RSpec)

This is a clean starting point (with tests) for the classic **String Calculator** TDD kata.

> ✅ Recommended flow: unskip (remove `xit`/`xcontext`) one example at a time, make it pass with the smallest change, refactor, then commit.

## Requirements implemented by the specs
- `add("")` returns `0`
- `add("1")` returns `1`
- `add("1,5")` returns `6`
- Allow any amount of numbers separated by commas
- Allow newlines as delimiters in addition to commas (e.g., `"1\n2,3"` returns `6`)
- Support custom delimiter: a header of the form `"//<delimiter>\n<numbers...>"` (e.g., `"//;\n1;2"` returns `3`)
- Calling `add` with negative numbers raises: `negative numbers not allowed <negatives...>` where all negatives are listed and comma-separated.

> Note: This kata variant **does not** include rules like ignoring numbers > 1000 or multi-character delimiters. You can extend the test suite later if desired.

## Getting started

```bash
# 1) Install dependencies
bundle install

# 2) Run the tests (all later steps are initially skipped)
bundle exec rspec

# 3) Enable one spec at a time by changing `xit` -> `it` (or `xcontext` -> `context`)
#    Then implement just enough code to pass, refactor, and commit.
```

## Suggested commit steps (example)
1. Add project scaffold, RSpec config, and first failing spec
2. Implement empty string -> 0
3. Implement single number
4. Implement two numbers with comma
5. Generalize to N comma-separated numbers
6. Add support for newlines as delimiters
7. Add support for custom delimiter prefix
8. Raise on negatives with all negatives in the message
9. Final refactor & README polish

## Screenshots to include in your repo
- `rspec` output after each step (showing red -> green progress)
- A snippet of your implementation evolution
- Final green test run

---

Happy TDD-ing! 🚀
