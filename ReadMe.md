:VimPluginCreateSupport
=======

快適なプラグイン作成を補助するために作成されました。

:環境
----

- Win10
- nyagos
- vim8.2

:変数 g:VimPluginCreateSupportFolder
----

必須ではありません。<br>
設定していると、新しくプラグインを作成する際に<br>
指定したディレクトリに新しいプラグインフォルダを作成します。<br>

指定していない場合は現在のカレントディレクトリ( :lcd )に作成されます。

:コマンド NewPlugin {}
----
引数に新しいプラグイン名を取ります。<br>

新しいタブを開き<br>
./plugin_name/autoload/plugin_name.vim<br>
./plugin_name/plugin/plugin_name.vim<br>
をそれぞれのウィンドウに開きます。<br>

カレントディレクトリ( lcd )は./plugin_nameに移動します。


ディレクトリは下記のように展開されます
```
"PluginName
"├─autoload
"└─plugin
```



:コマンド　NewPluginLoad
----

現在のカレントディレクトリにautoloadとpluginフォルダが存在している場合<br>
現在のディレクトリ名.vimをそれぞれsourceコマンドで読み込みます。<br>

現在のカレントディレクトリがautoload もしくは plugin フォルダだった場合はひとつ前のディレクトリを確認します。


現在のディレクトリが上記ではなく、<br>
またこのセッション中にNewPlugin もしくは NewPluginLoad<br>
コマンドを使用してプラグインを読み込んだ場合、直近のプラグインを読み込みます。<br>


:License
----
MIT

:Author
----
ambergon<br>
[twitter](https://twitter.com/Sc_lFoxGon)
