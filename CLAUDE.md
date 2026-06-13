# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Build
dotnet build

# Run (HTTPS on https://localhost:7123, HTTP on http://localhost:5125)
dotnet run --project cs3750indiv

# Run in watch mode (auto-reloads on file changes)
dotnet watch run --project cs3750indiv
```

No test project is currently configured.

## Architecture

This is an **ASP.NET Core Razor Pages** application targeting **.NET 10.0**.

Each page is a pair of files in `cs3750indiv/Pages/`:
- `.cshtml` — Razor markup (HTML + `@` expressions)
- `.cshtml.cs` — `PageModel` code-behind with `OnGet`/`OnPost` handlers

Routing is file-based: `Pages/Foo/Bar.cshtml` maps to `/Foo/Bar`. There is no separate controller layer.

**Key files:**
- `cs3750indiv/Program.cs` — middleware pipeline (HTTPS redirect, HSTS, static files, Razor Pages)
- `cs3750indiv/Pages/Shared/_Layout.cshtml` — master layout used by all pages via `_ViewStart.cshtml`
- `cs3750indiv/Pages/_ViewImports.cshtml` — global `@using` and Tag Helper imports
- `cs3750indiv/wwwroot/` — static assets (Bootstrap 5, jQuery, custom `site.css`/`site.js`)

**Environment config:**
- `appsettings.json` / `appsettings.Development.json` — logging and host settings
- `ASPNETCORE_ENVIRONMENT=Development` is set automatically by the launch profile
