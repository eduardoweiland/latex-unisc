# Modelo LaTeX UNISC

Este projeto contém o modelo LaTeX para escrita de trabalhos seguindo as normas da Universidade de Santa Cruz do Sul (UNISC).

O modelo está de acordo com a primeira edição atualizada das [_Normas para apresentação de trabalhos acadêmicos_][Normas UNISC], de 2013.

## Dependências

Os seguintes pacotes LaTeX são necessários para utilizar esse modelo:

* xargs
* indentfirst
* chngcntr
* setspace
* ccaption
* times
* mathptmx
* glossaries
* titlesec
* tocstyle
* geometry
* hyperref
* abntex2cite

O editor online [ShareLaTeX][] já possui todos esses pacotes, então funciona sem problemas.

Para instalação desses pacotes no Fedora 22+, o comando é:

    sudo dnf install texlive-xargs texlive-tools texlive-chngcntr \
        texlive-setspace texlive-ccaption texlive-times \
        texlive-psnfss texlive-glossaries texlive-titlesec \
        texlive-geometry texlive-hyperref texlive-abntex2

Para instalação no Ubuntu/Mint/Debian e derivados, o comando é:

    sudo apt-get install texlive-latex-base texlive-latex-recommended \
        texlive-latex-extra texlive-publishers

Para outros sistemas o nome dos pacotes e a forma de instalação pode ser diferente.

## Compilação com o modelo

Para utilizar apenas os estilos de formatação do modelo, os passos de compilação são os mesmos utilizados para outros documentos.

Se for utilizado o pacote `glossaries` (já incluído na classe) para criar a lista de abreviaturas, é necessário seguir os passos descritos no [manual do pacote][manual-glossaries].

> Se estiver utilizando o [ShareLaTeX][], a compilação já irá gerar os arquivos necessários pelo `glossaries`. Porém, ao adicionar novas entradas no glossário, é necessário remover os arquivos em cache para atualizá-los. Isso é feito clicando em Logs e arquivos de saída (ao lado do botão Recompilar) e no final clicar em Limpar arquivos em cache (botão com ícone de lixeira).


[ShareLaTeX]: https://pt.sharelatex.com "ShareLaTeX - Online LaTeX Editor"
[Normas UNISC]: http://www.unisc.br/portal/pt/editora/e-books/88/normas-para-apresentacao-de-trabalhos-academicos.html "Normas para apresentação de trabalhos acadêmicos"
[manual-glossaries]: http://mirrors.ctan.org/macros/latex/contrib/glossaries/glossaries-user.pdf "User Manual for glossaries"
