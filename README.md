# Search-Web

This is a PowerShell implementation of the oh-my-zsh [web-search](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/web-search) plugin. It allows you to search the web using a variety of services

## Installation

**Scoop**

```powershell
scoop bucket add jcwillox https://github.com/jcwillox/scoop-bucket
scoop install pwsh-search-web
```

## Usage

- `Search-Web <context> <term>...`
- `<context> <term>...`

```pwsh
Search-Web google oh-my-zsh
google oh-my-zsh
```

Available search contexts are:

| Context         | URL                                      |
| --------------- | ---------------------------------------- |
| `bing`          | `https://www.bing.com/search?q=`         |
| `google`        | `https://www.google.com/search?q=`       |
| `yahoo`         | `https://search.yahoo.com/search?p=`     |
| `duckduckgo`    | `https://www.duckduckgo.com/?q=`         |
| `startpage`     | `https://www.startpage.com/do/search?q=` |
| `yandex`        | `https://yandex.ru/yandsearch?text=`     |
| `github`        | `https://github.com/search?q=`           |
| `baidu`         | `https://www.baidu.com/s?wd=`            |
| `ecosia`        | `https://www.ecosia.org/search?q=`       |
| `goodreads`     | `https://www.goodreads.com/search?q=`    |
| `qwant`         | `https://www.qwant.com/?q=`              |
| `givero`        | `https://www.givero.com/search?q=`       |
| `stackoverflow` | `https://stackoverflow.com/search?q=`    |
| `wolframalpha`  | `https://wolframalpha.com/input?i=`      |
| `archive`       | `https://web.archive.org/web/*/`         |
| `scholar`       | `https://scholar.google.com/scholar?q=`  |
| `reddit`        | `https://www.reddit.com/search/?q=`      |

Also there are aliases for bang-searching DuckDuckGo:

| Context   | Bang  |
| --------- | ----- |
| `wiki`    | `!w`  |
| `news`    | `!n`  |
| `youtube` | `!yt` |
| `map`     | `!m`  |
| `image`   | `!i`  |
| `ducky`   | `!`   |

# Custom Engines & Bangs

Set the `$SearchWebEngines` or `$SearchWebBangs` variables before importing the module to add custom engines or bang-searches

```powershell
$SearchWebEngines = @{
    reddit = "https://www.reddit.com/search/?q="
}

$SearchWebBangs = @{
    youtube = "!yt"
}

Import-Module SearchWeb
```