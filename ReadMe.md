#VimPluginCreateSupport

快適なプラグイン作成を補助するために作成されました。

##環境

- Win10
- nyagos
- vim8.2

##変数
###g:VimPluginCreateSupportFolder

必須ではありません。
設定していると、新しくプラグインを作成する際に
指定したディレクトリに新しいプラグインフォルダを作成します。

指定していない場合は現在のカレントディレクトリ( :lcd )に作成されます。

##コマンド
###NewPlugin {}
引数に新しいプラグイン名を取ります。

新しいタブを開き
./plugin_name/autoload/plugin_name.vim
./plugin_name/plugin/plugin_name.vim
をそれぞれのウィンドウに開きます。

カレントディレクトリ( lcd )は./plugin_nameに移動します。


ディレクトリは下記のように展開されます
```
"PluginName
"├─autoload
"└─plugin
```



###NewPluginLoad
現在のカレントディレクトリにautoloadとpluginフォルダが存在している場合
現在のディレクトリ名.vimをそれぞれsourceコマンドで読み込みます。

現在のカレントディレクトリがautoload もしくは plugin フォルダだった場合はひとつ前のディレクトリを確認します。


現在のディレクトリが上記ではなく、
またこのセッション中にNewPluginコマンドを使用して新しいプラグインを作成した場合はそのプラグインを読み込みなおします。


##License
MIT

##Author
ambergon
[twitter](https://twitter.com/Sc_lFoxGon)
