# Diet

A Phoenix LiveView application for tracking diet and nutrition information.
**Developed using Test-Driven Development (TDD) methodology.**

## Getting Started

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Development Approach

This project strictly follows **Test-Driven Development (TDD)**:

- **Red**: Write failing test first
- **Green**: Implement minimal code to pass
- **Refactor**: Improve code while keeping tests green

All code changes must follow the Red-Green-Refactor cycle.

## AI Development Guidelines

This project includes AI agent configuration files to maintain TDD consistency when working with AI assistants:

- **`.ai_rules.md`** - Comprehensive TDD rules and guidelines for AI agents
- **`.ai_config.json`** - Machine-readable TDD configuration for AI tools
- **`.ai_prompt.md`** - TDD-focused template prompt for AI interactions
- **`.ai_quick_ref.md`** - Quick TDD reference guide for common patterns

### For AI Assistants

When working with AI assistants on this project:

1. **ALWAYS start with**: "Please read the .ai_rules.md file and confirm you understand the TDD approach before proceeding"
2. **Ensure TDD workflow**: All AI agents must follow Red-Green-Refactor cycle
3. **No code without tests**: AI must write failing tests before any production code

### TDD Rules Summary

- 🔴 **RED**: Write failing test first (mandatory)
- 🟢 **GREEN**: Write minimal code to pass test
- 🔵 **REFACTOR**: Clean up while keeping tests green
- 📊 **Coverage**: Maintain 95%+ test coverage
- 🚫 **No exceptions**: Never write production code before tests

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
