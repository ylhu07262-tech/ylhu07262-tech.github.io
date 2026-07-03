"""Export mechanism-dominance figure for portfolio (fixed margins and titles)."""

from __future__ import annotations

import importlib.util
from pathlib import Path

import matplotlib.pyplot as plt

ROOT = Path(__file__).resolve().parents[1]
OUT_PATH = ROOT / "assets" / "images" / "mechanism-dominance.png"
REDRAW_PATH = Path(r"D:\My_article\figures\figure1\figure1_panel_b_mechanism_dominance\redraw_figure1_panel_b.py")


def load_redraw_module():
    spec = importlib.util.spec_from_file_location("redraw_panel_b", REDRAW_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"Cannot load module: {REDRAW_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def export_figure() -> None:
    redraw = load_redraw_module()
    df = __import__("pandas").read_csv(redraw.DATA_PATH)
    profiles, source_types = redraw.build_profiles(df)
    strengths = redraw.build_band_strengths(profiles)
    fig = redraw.draw_panel_b(strengths, source_types)

    ax = fig.axes[0]
    ax.set_title("")
    ax.texts.clear() if hasattr(ax.texts, "clear") else None
    for txt in list(ax.texts):
        if redraw.SUBTITLE in txt.get_text():
            txt.remove()

    fig.suptitle(
        "Mechanism dominance along particle diameter",
        fontsize=11,
        fontweight="bold",
        y=0.95,
    )
    fig.text(0.5, 0.895, redraw.SUBTITLE, ha="center", va="top", fontsize=8.5, color="#444444")
    fig.subplots_adjust(left=0.36, right=0.98, top=0.80, bottom=0.13)

    OUT_PATH.parent.mkdir(parents=True, exist_ok=True)
    fig.savefig(OUT_PATH, dpi=240, bbox_inches="tight", pad_inches=0.22, facecolor="white")
    plt.close(fig)
    print(f"Saved: {OUT_PATH}")


if __name__ == "__main__":
    export_figure()
