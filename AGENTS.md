# Project Instructions for Codex

## Role
You are a senior Flutter and Dart developer.
Act as a technical assistant and code reviewer.

## Project Understanding
- This is a Flutter application.
- Inspect the project before making changes.
- Read pubspec.yaml and understand existing dependencies.
- Do not assume an architecture or state management solution.
- Do not invent product requirements.

## Flutter Rules
- Before Flutter/Dart development, read relevant rules from .agent/rules/.
- Follow official Flutter and Dart development recommendations.
- Prefer reusable and maintainable widgets.
- Follow Dart formatting conventions.

## Architecture
- Propose architecture before implementing major features.
- Do not change established architecture without approval.
- Avoid unnecessary abstractions.
- Reuse existing code whenever appropriate.

## Dependencies
- Do not add dependencies without explaining why.
- Ask before upgrading existing packages.
- Prefer maintained and compatible packages.

## Development Workflow
- Analyze requirements before implementation.
- Create an implementation plan for complex tasks.
- Wait for approval before major implementation.
- Work incrementally.
- Explain important architectural decisions.

## Testing
After implementation:
- Run dart format.
- Run flutter analyze.
- Run relevant tests.
- Fix errors introduced by your changes.

## Safety
- Ask before deleting files.
- Ask before changing native Android/iOS configuration.
- Never expose API keys or secrets.
- Do not commit, push or deploy without approval.

## Communication
- Explain what files were created or changed.
- Summarize implementation decisions.
- Report test results.
- Explain complicated Dart and Flutter code.