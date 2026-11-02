# counterswarm-testbed

> **Counterswarm test site. Every 'secret' here is fake and planted on purpose.**

This repository is the source of `https://testbed.counterswarm.si`, a site Counterswarm owns so it can check
that its own outside-in security checks (passive layer 1, owner-proven active layer 2) catch real mistakes
on a live site. Every key, password, token, database row and admin page here is fake. None of the
hosts, projects or apps named in it exist. Please do not report them.

## What is planted

| # | Planted mistake | Where |
|---|---|---|
| 1 | JS bundle with a public source map; sources show an admin page guarded only in the browser, API addresses, internal-looking hostnames and feature flags | `/assets/app.min.js`, `/assets/app.min.js.map` |
| 2 | Secrets in browser JS: generic high-entropy `API_KEY`, Stripe test-format key, fake Supabase URL + anon JWT + service_role JWT, Firebase config (non-existent projects) | bundle and rebuilt sources |
| 3 | Exposed files: `/.env`, `/.git/HEAD`, `/.git/config`, `/backup.sql`, `/dump.sql`, `/openapi.json` | site root |
| 4 | Grafana-like admin login at `/admin/` whose login-only API (`/admin/api/dashboards/home`) answers without a login | `/admin/` |
| 5 | `robots.txt` naming `/admin` and `/staging`, `sitemap.xml`, no `/.well-known/security.txt`, a `<script src>` to an unregistered domain, a third-party script (old jQuery) without `integrity=` | `/` |
| 6 | `/.well-known/assetlinks.json` and `apple-app-site-association` with a fake app id and deep-link paths | `/.well-known/` |
| - | Missing CSP, HSTS and X-Frame-Options headers (GitHub Pages cannot set them); sign-in page without a captcha | every page |

The dangling `<script>` is `type="text/plain"` and the pages carry a meta CSP limiting scripts to this site and
cdnjs, so it never loads in a browser even if someone registers that domain.

`site/dotgit` is published as `/.git` by the Pages workflow (a real `.git` folder cannot be committed).
