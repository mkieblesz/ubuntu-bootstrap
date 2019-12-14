# Ubuntu Bootstrap

* laptop - Lenovo x230
* distro - Ubuntu 18.04
* main window editor - vscode
* terminal - hyper.js
* cmd editor - vim
* cmd reverse history search - hstr
* cmd explorer - ranger
* languages - python, go, ruby, node, erlang/elixir, rust, haskell
* cmd tools - gcloud, git

## Shortcuts

### General

* ctrl+w - close current tab
* ctrl+shift+t - create new tab
* ctrl+pageup/pagedown - switch to previous/next tab
* ctrl+shift+pageup/pagedown - move current tab to the left/right
* ctrl-windowskey-down/up - minimize/maximize

### Terminal

* ctrl+l - clear window without removing scrollback
* ctrl+p - fuzzy search for files in current directory with preview and if found open in vim
* ctrl+o - fuzzy search for text recrusiviely in all files in current directory and if found open in vim at correct line and column
* ctrl+r - reverse history search
* ctrl+f - favourite command search
* ctrl+t - reverse history search ranked
* ctrl+d - exit shell
* ctrl+c - kill fg process
* ctrl+z - put current process into background
* ctrl+shift+f - search scrollback buffer
* shift+pageup/pagedown - scroll page up/down

## Python IDEs

Two most recommended editors are PyCharm or VsCode. PyCharm is considered better, as being fully
fledged IDE with most of the features working out of the box, while vscode is more configurable and
ligthweight. Here is configuration for vscode which replicates most of pycharm's features and works
very well. Before ensure that you've installed project's development requirements.

```bash
pip install isort black pytest flake8
```

Now put following configrations into `settings.json` and `launch.json` files.

`.vscode/settings.json`:
```json
{
    "editor.rulers": [
        100
    ],
    "explorer.confirmDragAndDrop": false,
    "files.exclude": {
        "**/__pycache__": true,
        "**/*.dist-info": true,
        "**/*.egg-info": true,
        ".coverage": true,
        ".venv/bin": true,
        ".venv/lib64": true,
        ".venv/share": true,
        ".venv/include": true,
        ".db": true,
        ".mypy_cache": true,
        ".pytest_cache": true,
        ".tox": true
    },
    "python.autoComplete.addBrackets": true,
    "python.formatting.blackArgs": [
        "-S",
        "-l",
        "100",
        "-t",
        "py37"
    ],
    "python.formatting.provider": "black",
    "python.linting.enabled": true,
    "python.linting.pylintEnabled": false,
    "python.testing.autoTestDiscoverOnSaveEnabled": false,
    "python.linting.flake8Enabled": true,
    "python.testing.unittestEnabled": false,
    "python.testing.nosetestsEnabled": false,
    "python.testing.pytestEnabled": true,
    "python.testing.pytestPath": "pytest",
    "python.testing.pytestArgs": ["--no-cov"],
    "python.pythonPath": ".venv/bin/python",
    "python.venvPath": ".venv",
    "python.workspaceSymbols.exclusionPatterns": [
        "**/__pycache__",
        ".db",
        ".mypy_cache",
        ".pytest_cache",
        ".tox",
        ".venv"
    ],
    "search.exclude": {
        "data-load": true
    },
    // disable class annotations
    "gitlens.codeLens.recentChange.enabled": false,
    "gitlens.codeLens.authors.enabled": false,
    "gitlens.blame.line.enabled": false
}
```

`.vscode/launch.json`:
```json
{
    "version": "2.0.0",
    "configurations": [
        {
            "name": "Python: Flask",
            "type": "python",
            "request": "launch",
            "module": "flask",
            "env": {
                "FLASK_APP": "wsgi.py",
                "FLASK_ENV": "development",
                "FLASK_DEBUG": "0"
            },
            "args": [
                "run",
                "--no-debugger",
                "--no-reload"
            ],
            "jinja": true
        }
    ]
}
```

Additionally you have to install following extentions.

```
bierner.markdown-preview-github-styles
christian-kohler.path-intellisense
eamodio.gitlens
eriklynd.json-tools
KevinRose.vsc-python-indent
mikestead.dotenv
ms-azuretools.vscode-docker
ms-python.python
VisualStudioExptTeam.vscodeintellicode
vscode-icons-team.vscode-icons
xyz.plsql-language
yzhang.markdown-all-in-one
```

Some of these extentions, like intellicode, will require some additional steps once installed.

* sidebar views
    * files - workspace file explorer with all unnecessary files/folders hidden away
    * search - search view for finding expressions within current workspace
    * git - review and manage git changes
    * debug - click debug icon in the sidebar to open git view
    * extensions - manage extensions
    * testing - view and manage entire test suite (you can also run individual tests by clicking
      `Run Test` link above test function definition)
    * docker - view and manage all running containers on your host
    * gitlense - more elaborate git repo management/views
* commonly used shortcuts
    * *ctrl+r* - open/switch between recent vscode projects
    * *ctrl+shift+p* - show and run commands
    * *ctrl+shift+d* - go to debugger
    * *ctrl+p* - search and go to file within workspace and site-packages
    * *ctrl+t* - search and go to symbol (class, function, attribute, function argument, markdown
      section, import definition in module)
    * *ctrl+shift+f* - search all files in workspace
    * *ctrl+b* - hide/show sidebar
    * *F8* - go to next problem in the file
    * *ctrl+F12* - go to definition
    * *ctrl+d* - find next occurence and add cursor (multiselection)
    * *ctrl+c* - copy current line/selection
    * *ctrl+x* - cut current line/selection
    * *alt+up/down* - move current selection up/down

Here are additional key bindings.


```json
[
    {
        "key": "alt+-",
        "command": "workbench.action.navigateBack"
    },
    {
        "key": "shift+alt+-",
        "command": "workbench.action.navigateForward"
    },
    {
        "key": "ctrl+f12",
        "command": "editor.action.revealDefinition",
        "when": "editorHasDefinitionProvider && editorTextFocus && !isInEmbeddedEditor"
    },
    {
        "key": "ctrl+k ctrl+f12",
        "command": "editor.action.revealDefinitionAside",
        "when": "editorHasDefinitionProvider && editorTextFocus && !isInEmbeddedEditor"
    },
    {
        "key": "ctrl+l",
        "command": "editor.action.joinLines"
    },
    {
        "key": "ctrl+i",
        "command": "editor.action.organizeImports",
        "when": "editorTextFocus && !editorReadonly && supportedCodeAction =~ /(\\s|^)source\\.organizeImports\\b/"
    },
    {
        "key": "ctrl+u",
        "command": "editor.action.formatDocument",
        "when": "editorHasDocumentFormattingProvider && editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly"
    },
    {
        "key": "ctrl+u",
        "command": "editor.action.formatDocument.none",
        "when": "editorTextFocus && !editorHasDocumentFormattingProvider && !editorHasDocumentFormattingProvider && !editorReadonly"
    }
]
```
