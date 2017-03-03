# Histórico do Modelo LaTeX UNISC

## v1.1.2 (02 mar. 2017)

Essa é uma versão que contém apenas correção de bugs, sem alteração de outras funcionalidades.

* [#12](https://github.com/eduardoweiland/latex-unisc/issues/12) [BUGFIX] Erro relacionado ao Babel ao compilar um projeto no ShareLaTeX

## v1.1.1 (05 nov. 2016)

Essa é uma versão que contém apenas correção de bugs, sem alteração de outras funcionalidades.

* [#8](https://github.com/eduardoweiland/latex-unisc/issues/8) [BUGFIX] Items de anexo no sumário estão se sobrepondo
* [#9](https://github.com/eduardoweiland/latex-unisc/issues/9) [BUGFIX] Primeiro item de anexo no sumário não possui numeração de página
* [#10](https://github.com/eduardoweiland/latex-unisc/issues/10) [BUGFIX] Título dos anexos não está quebrando a linha

## v1.1 (11 jun. 2016)

Essa versão introduziu uma incompatibilidade com documentos antigos, sendo necessário adicionar a chamada de um novo comando no preâmbulo dos documentos. Devido à correção do issue [#3](https://github.com/eduardoweiland/latex-unisc/issues/3), a titulação agora deve ser especificada explicitamente, além do nome do curso, utilizando o comando `\degree`. O preâmbulo do documento agora deve incluir o seguinte, por exemplo:

``` tex
\dept{Departamento de Computação}
\course{Curso de Ciência da Computação}
\degree{Bacharel em Ciência da Computação}
```

* [#3](https://github.com/eduardoweiland/latex-unisc/issues/3) [BUGFIX] Nome do curso estava fixo no namedefs.babel
* [#5](https://github.com/eduardoweiland/latex-unisc/issues/5) [BUGFIX] Número das figuras fica sobreposto ao rótulo Figura na lista de ilustrações
* [#4](https://github.com/eduardoweiland/latex-unisc/issues/4) [FEATURE] Adicionar estilos para listagens de código-fonte

## v1.0 (09 jul. 2015)

* Primeira versão publicada

