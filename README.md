# Cosmochlore documentation

Source for the [Cosmochlore](https://github.com/Yluro/cosmochlore) documentation site, published at **https://yluro.github.io/cosmochlore-docs**.

The site is built with [Quartz v5](https://quartz.jzhao.xyz/) and deployed to GitHub Pages by GitHub Actions on every push to `main`.

## Layout

| Path                           | What it is                                                                            |
| ------------------------------ | ------------------------------------------------------------------------------------- |
| `content/`                     | The documentation pages (Markdown). This is the only folder you normally edit.        |
| `quartz.config.yaml`           | Site settings: title, base URL, theme colours, plugins and layout.                    |
| `.github/workflows/deploy.yml` | Builds the site and publishes it to GitHub Pages.                                     |
| `quartz/`, `docs/`, etc.       | Quartz itself and its own documentation. Leave these alone so upgrades merge cleanly. |

## Local preview

Requires Node.js 22 or later.

```bash
npm ci
npx quartz build --serve
```

Then open http://localhost:8080. The page reloads as you edit files in `content/`.

## Writing pages

- Each `.md` file in `content/` becomes a page; folders become sections, and a folder's `index.md` is its landing page.
- Start each page with front matter containing at least a `title`.
- Link between pages with wikilinks, e.g. `[[commands/cshm|cshm]]`. Inside tables, escape the pipe: `[[commands/cshm\|cshm]]`.
- Math uses KaTeX: `$x$` inline, `$$ ... $$` for display equations.
- Callouts use Obsidian syntax: `> [!note]`, `> [!tip]`, `> [!warning]`, `> [!todo]`.
- The `content/` folder can be opened as an Obsidian vault.

See the [Quartz authoring guide](https://quartz.jzhao.xyz/authoring-content) for everything else.

## Publishing

Commit and push to `main` (or run `npx quartz sync`). The **Deploy docs to GitHub Pages** workflow builds and publishes the site.

One-time setup on GitHub: **Settings → Pages → Build and deployment → Source: GitHub Actions**.

## Upgrading Quartz

```bash
npx quartz upgrade
```

This pulls the latest Quartz from the `upstream` remote (`jackyzha0/quartz`, branch `v5`) into this repository.

## License

Quartz is MIT-licensed (see `LICENSE.txt`). Cosmochlore itself is GPL-3.0.
