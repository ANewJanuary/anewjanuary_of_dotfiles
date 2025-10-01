from dooit.ui.api import DooitAPI, subscribe
from dooit.ui.api.events import Startup
from dooit.api.theme import DooitThemeBase
from dooit.ui.api.widgets import TodoWidget
from rich.style import Style
from rich.text import Text


class Everforest(DooitThemeBase):
    _name: str = "dooit-everforest"

    # background colors
    # background1: str = "#2b3339"  # Darkest
    background1: str = "#00191f"  # Darkest
    background2: str = "#323d43"  # Lighter
    background3: str = "#3a454a"  # Lightest

    # foreground colors
    foreground1: str = "#eee8d5"  # Darkest
    foreground2: str = "#e9e8d2"  # Lighter
    foreground3: str = "#fdf6e3"  # Lightest

    # other colors
    red: str = "#e67e80"  # Red
    orange: str = "#e69875"  # Orange
    yellow: str = "#dbbc7f"  # Yellow
    green: str = "#a7c080"  # Green
    blue: str = "#7fbbb3"  # Blue
    purple: str = "#d699b6"  # Purple
    magenta: str = "#d699b6"  # Magenta (same as purple in Everforest)
    cyan: str = "#83c092"  # Cyan

    # accent colors
    primary: str = blue
    secondary: str = blue


@subscribe(Startup)
def setup_colorscheme(api: DooitAPI, _):
    api.css.set_theme(Everforest)


