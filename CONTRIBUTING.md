# Contributing Guide

### Formatting Your Issues

- **Title:** Keep your issue title concise and descriptive. It should provide a summary of the problem or feature.
- **Description:** Start with a clear description of the issue. If it's a bug, describe the bug and how one can reproduce it. If it's a feature, describe what you want to achieve.
- **Labels:** Use labels (if available) to categorize your issue, e.g., `fix`, `feat`, `doc`, etc. For more information on prefixes, see [prefixes](#commit-message-conventions).
- **Screenshots:** A picture is worth a thousand words. If applicable, add screenshots to help explain your problem or idea.
- **Environment:** When reporting a bug, specify details about your environment such as the OS, browser/version, and any other relevant software information.

### Branch Naming and Creation

- After you've identified an issue you want to work on (or have created one), you'll need to create a branch in your fork to implement the changes.
- Branch naming is important as it informs others about the kind of work being done in that branch. Here's a simple convention you can use:
  - If you're working on a bugfix related to issue number #123, name your branch something like `fix/123-short-description-of-the-bug`.
  - For features, you can use: `feat/123-short-description-of-the-feature`.
  - Other prefixes you can consider using include: `refactor/`, `docs/`, `test/`, among others. For more information on prefixes, see [prefixes](#commit-message-conventions)
- Once your branch is created, you can make your changes, keeping commits clear and focused. When you're ready, submit a pull request against the main project repository.
- Make sure to format the document with prettier using `npm run prettier` before submitting the pull request

## Styleguides

### Commit Message Conventions

When committing to this repository, please follow the below conventions for your commit messages to ensure clarity and consistency.

## 1. `feat`: New Features

Use this prefix when introducing a new feature to the application.

Example:
feat: add search functionality


## 2. `fix`: Bug Fixes

Use this prefix when making bug fixes.

Example:
fix: resolve login inconsistency


## 3. `doc`: Documentation Changes

Use this prefix for commits that are documentation-related, such as updating the README, adding comments to code, or creating new documentation files.

Example:
doc: update README with new setup instructions

## 4. `refactor`: Refactoring code
Use this prefix for when you refactor or reformat a piece of code to make it more according to our guidlines.

Example: refactor: refactored fileReducer to use enums

## 5. `remove`: Adding test
Use this prefix  for commits that remove code or files.

Example: remove: removed installer.png due to it no longer being needed

## All in all...

If you're new to the project and want to contribute, please ensure you follow the commit message conventions outlined above. This ensures the git history is readable and understandable.