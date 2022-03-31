






"現在編集しているファイルのディレクトリに plugin autoload　のフォルダがあれば
"現在のdirectory名.vimを autoload plugin フォルダからそれぞれ読み込む
"
"現在編集しているファイルのディレクトリがautoload or plugin or docならば
"ひとつ前のディレクトリを確認する。
"
"
"


"開発プラグイン等の保存先
"g:VimDevFolder = '~/...'


function! VimPluginCreateSupport#LoadFiles()

    let l:plugin_name = ''

    "現在編集中のファイルパス
    let l:dir = expand( "%:p:h" ) 
    "echo 'l:dir :' . l:dir

    "現在編集しているファイルがautoload or plugin or doc の中の場合 
    let l:check = substitute( l:dir , '.*\' , '' , 'g' )
    "echo 'l:check :' . l:check
    if l:check == 'autoload' || l:check == 'plugin' || l:check == 'doc'
        let l:dir = substitute( l:dir , l:check . '$' , '' , 'g' )
        let l:dir = substitute( l:dir , '\\$' , '' , 'g' )
        "echo 'l:dir :' . l:dir
    endif


    "autoloadとpluginが存在している場合に処理をする
    if isdirectory( l:dir . '/autoload' ) && isdirectory( l:dir . '/plugin' )

        let l:plugin_name = substitute( l:dir , '.*\\.\{-}' , '' , 'g' )
        "echo 'l:plugin_name :' . l:plugin_name

        "フォルダ名.vimをそれぞれ読み込むように
        let l:autoload_vim = l:dir . '/autoload/' . l:plugin_name . '.vim'
        let l:plugin_vim   = l:dir . '/plugin/'   . l:plugin_name . '.vim'

        if filereadable( l:autoload_vim )
            echo 'load : ' . l:autoload_vim
            execute 'source ' . l:autoload_vim
        endif
        if filereadable( l:plugin_vim )
            echo 'load : ' . l:plugin_vim
            execute 'source ' . l:plugin_vim
        endif
        
    "直近で編集したファイルがあればそれを読み込む
    else
        if exists( "s:NewPluginDirectory" )

            echo 'load plugin path : ' . s:NewPluginDirectory
            let l:autoload_vim = s:NewPluginDirectory . '/autoload/' . s:NewPluginName . '.vim'
            let l:plugin_vim   = s:NewPluginDirectory . '/plugin/'   . s:NewPluginName . '.vim'

            if filereadable( l:autoload_vim )
                echo 'load : ' . l:autoload_vim
                execute 'source ' . l:autoload_vim
            endif
            if filereadable( l:plugin_vim )
                echo 'load : ' . l:plugin_vim
                execute 'source ' . l:plugin_vim
            endif
        endif
    endif


endfunction



"現在のカレントディレクトリにもしくはg:VimDevFolderに下記のように展開する
"PluginName
"├─autoload
"└─plugin
"
"新しいタブで開き、lcdはPluginName Folderに設定される。
function! VimPluginCreateSupport#MakeFiles( PluginName )

    execute( 'tabe' )
    "pluginの保存先が指定されている場合はそちらに移動
    if exists( "g:VimDevFolder" )
        execute( 'lcd ' . expand( g:VimDevFolder ))
    endif

    if !isdirectory( a:PluginName )
        call mkdir( a:PluginName )
    endif

    execute( 'lcd ./' . a:PluginName )

    if !exists(  './autoload' )
        call mkdir( './autoload' )
    endif
    if !exists(   './plugin' )
        call mkdir( './plugin' )
    endif

    execute( 'edit ./autoload/' . a:PluginName . '.vim' )
    execute( 'vs ./plugin/'     . a:PluginName . '.vim' )
    let s:NewPluginName = a:PluginName
    let s:NewPluginDirectory = getcwd()
endfunction


































