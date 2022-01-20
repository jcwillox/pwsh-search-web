$urls = @{
    google        = "https://www.google.com/search?q="
    bing          = "https://www.bing.com/search?q="
    yahoo         = "https://search.yahoo.com/search?p="
    duckduckgo    = "https://www.duckduckgo.com/?q="
    startpage     = "https://www.startpage.com/do/search?q="
    yandex        = "https://yandex.ru/yandsearch?text="
    github        = "https://github.com/search?q="
    baidu         = "https://www.baidu.com/s?wd="
    ecosia        = "https://www.ecosia.org/search?q="
    goodreads     = "https://www.goodreads.com/search?q="
    qwant         = "https://www.qwant.com/?q="
    givero        = "https://www.givero.com/search?q="
    stackoverflow = "https://stackoverflow.com/search?q="
    wolframalpha  = "https://www.wolframalpha.com/input/?i="
    archive       = "https://web.archive.org/web/*/"
    scholar       = "https://scholar.google.com/scholar?q="
    reddit        = "https://www.reddit.com/search/?q="
}

if ($global:SearchWebEngines) {
    $urls += $global:SearchWebEngines
}

$bangs = @{
    wiki    = "!w"
    news    = "!n"
    youtube = "!yt"
    map     = "!m"
    image   = "!i"
    ducky   = "!"
}

if ($global:SearchWebBangs) {
    $bangs += $global:SearchWebBangs
}

function Search-Web {
    param (
        [string]$Context
    )

    if (-not $urls[$Context]) {
        Write-Host "Search engine '$Context' is not supported"
        return
    }

    if ($args.Count -gt 0) {
        Start-Process ($urls[$Context] + ($args -join "+"))
    } else {
        $parts = ($urls[$Context] -split "/")
        Start-Process ($parts[0] + "//" + $parts[2])
    }
}

foreach ($name in $urls.Keys) {
    Set-Item -Path Function:$name -Value { Search-Web $name @args }.GetNewClosure()
}

foreach ($name in $bangs.Keys) {
    $bang = $bangs[$name]
    Set-Item -Path Function:$name -Value { Search-Web "duckduckgo" "\$bang" @args }.GetNewClosure()
}

$exportModuleMemberParams = @{
    Function = $urls.Keys + $bangs.Keys + @(
        "Search-Web"
    )
}

Export-ModuleMember @exportModuleMemberParams
