"""MkDocs build hooks for trimming unused assets."""
from __future__ import annotations

from pathlib import Path


def on_post_build(config):
    """Remove unused translation assets from the generated site."""
    site_dir = Path(config.get("site_dir", "site"))
    lunr_dir = site_dir / "assets" / "javascripts" / "lunr"
    translation_dir = lunr_dir / "min"

    if translation_dir.is_dir():
        for path in translation_dir.iterdir():
            if path.name != "lunr.stemmer.support.min.js":
                path.unlink(missing_ok=True)

    for filename in ("tinyseg.js", "wordcut.js"):
        extra = lunr_dir / filename
        extra.unlink(missing_ok=True)
