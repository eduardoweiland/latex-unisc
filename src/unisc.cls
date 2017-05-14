%==============================================================================
% unisc.cls - classe para documentos com padrões da UNISC
% Parcialmente baseado no antigo modelo do dinfunisc e no modelo do iiufrgs
%
% Copyright (C) 2015 - 2017 Eduardo Weiland <eduardo@eduardoweiland.info>
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Eduardo Weiland.
%
% This work consists of the files unisc.cls, namedefs.babel, tc.def
% and propostatc.def.
%==============================================================================

%==============================================================================
% Identificação
%==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unisc}[2017/05/14 v1.2.0 Formatacao de documentos para a UNISC]

%==============================================================================
% Declaração de opções
%==============================================================================

% Cria opções para todos os modelos existentes no momento
% Ex.: \documentclass[tc]{unisc}
\newcommand{\unisc@novodoc}[1]{
  \ifx\@tiposdocs\undefined%
    \edef\@tiposdocs{#1}%
  \else%
    \edef\@tiposdocs{\@tiposdocs, #1}%
  \fi%
  \DeclareOption{#1}{\def\@tipodoc{#1}\AtEndOfClass{\input{#1.def}}}%
}

\unisc@novodoc{tc}
\unisc@novodoc{propostatc}

% Outras opções
\DeclareOption{showlinks}{\gdef\@linkcolor{blue}\OptionNotUsed}\gdef\@linkcolor{black}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

% Validação do tipo de documento informado
\ifx\@tipodoc\undefined
  \ClassError{unisc}{Nenhum tipo de documento especificado}{%
    É necessário informar o tipo de documento que será gerado. Os tipos %
    disponíveis são \@tiposdocs.%
  }
\fi

%==============================================================================
% Herança da classe `report' e inclusão de pacotes e arquivos necessários
%==============================================================================
\LoadClass[12pt,a4paper,oneside]{report}

% Definições de nomes padrão (capítulos, seções, legendas, etc.)
% Carrega apenas no início do documento para utilizar os idiomas carregados no babel
\AtBeginDocument{%
  \makeatletter%
  \input{namedefs.babel}%
  \makeatother%
}

\RequirePackage{xargs}             % Criação de comandos com vários argumentos opcionais
\RequirePackage{indentfirst}
\RequirePackage{chngcntr}          % Modifica contadores da classe report
\RequirePackage{setspace}          % Altera o espaço entre as linhas
\RequirePackage{ccaption}          % Formato de legendas de figuras e tabelas
\RequirePackage{times}             % Fonte "Adobe Times" (semelhante a Times New Roman)
\RequirePackage{mathptmx}          % Usa a fonte "Adobe Times" nas fórmulas
\RequirePackage{listings}          % Listagens de códigos-fonte
\RequirePackage[acronym,nonumberlist]{glossaries} % Lista de abreviaturas e símbolos

\RequirePackage{titlesec}          % Formatação de títulos de capítulos e seções
\RequirePackage[tocindentauto,tocflat,toctextentriesindented]{tocstyle}  % Estilos do sumário

% Definição das margens das páginas
\RequirePackage[top=3cm, inner=3cm, outer=2cm, bottom=2cm]{geometry}

% Inclusão de links no PDF gerado.
\RequirePackage[
  bookmarksnumbered=true,
  breaklinks=true,
  unicode=true,
  colorlinks=true,
  allcolors=\@linkcolor
]{hyperref}

\RequirePackage[alf]{abntex2cite}  % Estilo de referências da ABNT

\makeglossaries

%==============================================================================
% Espaçamento do texto
%==============================================================================

% Identação de 1cm
\setlength{\parindent}{1cm}

% Espaçamento entre linhas 1.5
\setstretch{1.5}

%==============================================================================
% Numeração das páginas
%==============================================================================
\def\ps@unisc{
  \let\@oddfoot\@empty
  \let\@evenfoot\@empty
  \def\@evenhead{\small\thepage\hfill}
  \def\@oddhead{\hfill\small\thepage}
}
\pagestyle{empty}
\let\ps@plain\ps@empty

%==============================================================================
% Definição de autor(es), orientador, co-orientador e avaliadores
%==============================================================================
\newcounter{ii@authorcount}
\renewcommand{\author}[2]{
  \addtocounter{ii@authorcount}{1}
  \expandafter\gdef\csname @author\alph{ii@authorcount}last\endcsname{#1}
  \expandafter\gdef\csname @author\alph{ii@authorcount}first\endcsname{#2}
  \expandafter\gdef\csname @author\alph{ii@authorcount}\endcsname{#2 #1}
}
\DeclareRobustCommand{\advisor}[3][]{
  \gdef\@advisorlast{#2}
  \gdef\@advisorfirst{#3}
  \gdef\@advisor{#1~#3 #2}
  \gdef\@advisornamethis{\advisorname}
}
\DeclareRobustCommand{\advisorF}[3][]{
  \gdef\@advisorlast{#2}
  \gdef\@advisorfirst{#3}
  \gdef\@advisor{#1~#3 #2}
  \gdef\@advisornamethis{\advisornamef}
}
\DeclareRobustCommand{\coadvisor}[3][]{
  \gdef\@coadvisorlast{#2}
  \gdef\@coadvisorfirst{#3}
  \gdef\@coadvisor{#1~#3 #2}
  \gdef\@coadvisornamethis{\coadvisorname}
}
\DeclareRobustCommand{\coadvisorF}[3][]{
  \gdef\@coadvisorlast{#2}
  \gdef\@coadvisorfirst{#3}
  \gdef\@coadvisor{#1~#3 #2}
  \gdef\@coadvisornamethis{\coadvisornamef}
}
\newcounter{ii@reviewercount}
\DeclareRobustCommand{\reviewer}[3][]{
  \addtocounter{ii@reviewercount}{1}
  \expandafter\gdef\csname @reviewer\alph{ii@reviewercount}last\endcsname{#2}
  \expandafter\gdef\csname @reviewer\alph{ii@reviewercount}first\endcsname{#3}
  \expandafter\gdef\csname @reviewer\alph{ii@reviewercount}\endcsname{#1~#3 #2}
  \expandafter\gdef\csname @reviewernamethis\alph{ii@reviewercount}\endcsname{\reviewername}
}
\DeclareRobustCommand{\reviewerF}[3][]{
  \addtocounter{ii@reviewercount}{1}
  \expandafter\gdef\csname @reviewer\alph{ii@reviewercount}last\endcsname{#2}
  \expandafter\gdef\csname @reviewer\alph{ii@reviewercount}first\endcsname{#3}
  \expandafter\gdef\csname @reviewer\alph{ii@reviewercount}\endcsname{#1~#3 #2}
  \expandafter\gdef\csname @reviewernamethis\alph{ii@reviewercount}\endcsname{\reviewernamef}
}

%==============================================================================
% Informações para a Capa
% Local, data, departamento e curso
%==============================================================================
\newcommand{\location}[2]{
  \gdef\@city{#1}
  \gdef\@state{#2}
}
\location{Santa~Cruz~do~Sul}{RS}

\renewcommand{\date}[3]{
  \gdef\@publday{#1}
  \gdef\@publmonth{#2}
  \gdef\@publyear{#3}
}
\date{\number\day}{\monthname}{\number\year}

\newcommand{\dept}[1]{\gdef\@dept{#1}}
\newcommand{\course}[1]{\gdef\@course{#1}}
\newcommand{\degree}[1]{\gdef\@degree{#1}}

%==============================================================================
% Definição das capas
%==============================================================================
\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{160mm}
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{110mm}
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{20mm}

\newcommand{\makecapa}{%
  \begin{titlepage}
    \vspace*{-1cm}
    \noindent\@topboxcapa\\
    \par
    \vfill
    \centerline{\@city}
    \centerline{\@publyear}
    \vspace*{26mm}
  \end{titlepage}
  \clearpage
}

\def\@topboxcapa{%
  \parbox[t]{\textwidth}{%
    \centering%
    \vbox to \titlepagewinvoffset{%
      \vspace*{40mm}
      \titlepagetopinfocapa\vfill\setstretch{1.5}\@winboxcapa
    }
  }
}

\newcommand{\titlepagetopinfocapa}{%
  \texorpdfstring{\MakeUppercase{\textbf{\@course}}}{\textbf{\@course}}
}
\def\@winboxcapa{%
  \parbox[b]{\titlepagewinwidth}{%
    \centering\vbox to \titlepagewinheight{%
      \vspace*{5cm}
      \@authora\\
      \vspace*{3cm}
      \textbf{\texorpdfstring{\MakeUppercase{\@title}}{\@title}}\par
      \vspace*{3cm}
    }
  }%
}
\newcommand{\titlepagecapaorientador}{%
  \vspace*{2cm}
  \@ifundefined{@advisor}{}{\@advisor\\\@advisornamethis\\}
}
\newcommand{\titlepagecapacoorientador}{%
  \vspace*{2cm}
  \@ifundefined{@coadvisor}{}{\@coadvisor\\\@coadvisornamethis\\}
}

\newcommand{\titlepagecapabanca}{%
  \vspace*{2cm}
  \@ifundefined{@reviewer}{}{\@reviewer\\\@reviewernamethis\\}
}

%==============================================================================
% Definição padrão da folha de rosto.
% Os dados específicos do tipo de trabalho (dissertação, tese, etc.) são
% informados definindo-se o comando \titlepagespecificinfo. Veja os
% arquivos .def incluídos com a classe.
%==============================================================================
\renewcommand{\maketitle}{%
  \begin{titlepage}
    \thetitlepage
  \end{titlepage}%
  \clearpage%
  \setcounter{page}{2}%
}
\newcommand{\thetitlepage}{%
  \setstretch{1.0}
  \noindent\@topbox\\
  \vfill
  \vfill
  \@ifundefined{titlepagespecificinfo}{}{
    \hspace*{\fill}\makebox[.53\textwidth][l]{%
      \parbox[b]{8.5cm}{\setstretch{1.0}\titlepagespecificinfo}%
    }
    \linebreak
    \linebreak
    \linebreak
    \linebreak
    \linebreak
  }
  \@ifundefined{@advisor}{}{
    \titlepageadvisorinfo
  }
  \titlepagedate
}
\def\@topbox{%
  \parbox[t]{\textwidth}{%
    \centering%
    \vbox to \titlepagewinvoffset{%
      \@ifundefined{titlepagetopinfo}{}{\titlepagetopinfo}%
      \vfill\setstretch{1.5}\@winbox%
    }
  }
}
\def\@winbox{%
  \parbox[b]{\titlepagewinwidth}{%
    \centering\vbox to \titlepagewinheight{%
      \titlewinboxcontent%
    }%
  }%
}

%==============================================================================
% Definição da página de assinaturas.
%==============================================================================
\newcommand{\makesignature}{%
  \clearpage
  \vspace*{5cm}
  \begin{flushright}
    \@city, \unisc@dateday
    \vspace*{2cm}\\
    {\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}\\
    \@authora
    \vspace*{2cm}\\
    {\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}\\
    \@advisor
    \@ifundefined{@coadvisor}{}{
      \vspace*{2cm}\\
      {\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}{\_}\\
      \@coadvisor
    }
  \end{flushright}
}

%==============================================================================
% Definições de formatação do sumário
%==============================================================================

\renewcommand{\@dotsep}{0}
\newlength{\dottedspace}
\newcommand{\pnbox}[1]{\settowidth{\dottedspace}{\bfseries#1}\hb@xt@\dottedspace{#1}}
\settocstylefeature{pagenumberbox}{\pnbox}

\settocfeature[toc]{entryvskip}{-4pt}
\settocfeature[toc][0]{entryvskip}{6pt}
\settocfeature[toc]{entryhook}{\bfseries}
\settocfeature[lof][1]{entryhook}{\figurename~\hskip\leftskip}
\settocfeature[lot][1]{entryhook}{\tablename~\hskip\leftskip}
\settocfeature[lol][1]{entryhook}{\lstlistingname~\hskip\leftskip}

\newif\if@aftertoc
\@aftertocfalse
\renewcommand{\tableofcontents}{%
  \chapter*{\contentsname}
  \@starttoc{toc}\@aftertoctrue%
}

%==============================================================================
% Definição dos formatos de listas (abreviaturas, símbolos, códigos)
%==============================================================================

\glsnogroupskiptrue

% Estilo da lista de abreviaturas e símbolos utilizado pela UNISC
\setglossarystyle{super}

% Remove o ponto no final da descrição da abreviatura
\renewcommand*{\glspostdescription}{}

% Título da lista de abreviaturas
\renewcommand{\acronymname}{\listabbrvname}

% Rótulo do código usado no comando \autoref{}
\renewcommand{\lstlistingname}{\listingname}

% Título da lista de códigos
\renewcommand{\lstlistlistingname}{\listlistingsname}

% Configurações padrão para todos os códigos
\lstset{
  numberbychapter=false,
  frame=single,
  basicstyle=\ttfamily\small,
  lineskip=-1pt    % Reset do espaçamento 1.5 do texto
}

%==============================================================================
% Redefinição do ambiente para resumo (abstract)
%
% Ambiente pode ser utilizado tanto para o resumo em língua vernácula quanto
% para língua estrangeira.
%
% Uso:
%
% \begin{abstract}[idioma][Título]
%    \keywords[Palavras-chave]{Palavra chave, outra palavra chave}
%    Texto do abstract.
% \end{abstract}
%
% Todos os parâmetros possuem valor padrão para o resumo em português.
%==============================================================================

\newcommand{\keywords}[2][\keywordsname]{%
  \gdef\@keywordsname{#1}
  \gdef\@keywords{#2}
}

\renewenvironmentx{abstract}[2][1=brazilian, 2=\abstractname]{%
  \if@openright\cleardoublepage\else\clearpage\fi%
  \newif\if@abstractotherlang\@abstractotherlangfalse%
  \iflanguage{#1}{}{\@abstractotherlangtrue\begin{otherlanguage}{#1}}%
  \chapter*{#2}
}{%
  \\\\\noindent\textbf{\@keywordsname:} \@keywords.
  \if@abstractotherlang\end{otherlanguage}\fi%
}

%==============================================================================
% Formatação dos capítulos.
% Os comandos \@chapter e \@schapter são redefinidos para que a
% numeração de páginas seja correta (deve aparecer somente a partir do
% primeiro capítulo do texto, mas não nas páginas iniciais de
% capítulos).
% Os comandos \@makechapterhead e \@makeschapterhead fazem a
% formatação dos títulos propriamente ditos.
%==============================================================================
\newcommand{\unisc@chapterfont}{\@setfontsize\Large{12}{20}}

\def\@chapapp{}
\def\@appendixname{}

\newif\if@appendixchapter\@appendixchapterfalse

% Implementação do comando \chapter{Título} para capítulos numerados
\def\@chapter[#1]#2{%
  \par
  \if@appendixchapter%
    \refstepcounter{ii@appendix}%
    \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeUppercase{\@appendixname}}{\@appendixname}~\thechapter~--~\texorpdfstring{\MakeUppercase{#1}}{#1}}%
  \else%
    \refstepcounter{chapter}%
    \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}\texorpdfstring{\MakeUppercase{#1}}{#1}}%
  \fi%
  \addtocontents{lof}{\protect}%
  \addtocontents{lot}{\protect}%
  \pagestyle{unisc}\let\ps@plain\ps@unisc%
  \@makechapterhead{#2}\@afterheading
}

% Formatação do capítulo \chapter para exibição na página onde foi definido
\def\@makechapterhead#1{%
  \if@appendixchapter%
    \begin{center}%
      \reset@font{\unisc@chapterfont\noindent\textbf{\texorpdfstring{\MakeUppercase{\@appendixname}}{\@appendixname}~\thechapter~--~\texorpdfstring{\MakeUppercase{#1}}{#1}}}%
    \end{center}%
  \else%
    \reset@font{\unisc@chapterfont\noindent\textbf{\thechapter~\texorpdfstring{\MakeUppercase{#1}}{#1}}}%
  \fi%
  \vspace{12pt}
}


% Implementação do comando \chapter*{Título} para capítulos não numerados
\def\@schapter#1{%
  \if@aftertoc%
    \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeUppercase{#1}}{#1}}%
    \pagestyle{unisc}\let\ps@plain\ps@unisc%
  \fi%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makeschapterhead{#1}\@afterheading
}

% Formatação do capítulo \chapter* para exibição na página onde foi definido
\def\@makeschapterhead#1{%
  \addvspace{18pt}
  \reset@font\centerline{\unisc@chapterfont\textbf{\texorpdfstring{\MakeUppercase{#1}}{#1}}}
  \addvspace{18pt}
}

% Comando \annex para indicar o início dos anexos
\newcounter{ii@appendix}
\renewcommand{\appendix}[1][\appendixname]{%
  \setcounter{ii@appendix}{0}%
  \renewcommand{\thechapter}{\Alph{ii@appendix}}%
  \setcounter{tocdepth}{0}%
  \gdef\@appendixname{#1}
  \@appendixchaptertrue
}
\newcommand{\annex}{\appendix[\annexname]}

%==============================================================================
% Formatação das seções
%==============================================================================
\setcounter{secnumdepth}{4}

\titleformat{\section}[hang]{\bfseries}{\thesection~}{0pt}{}
\titlespacing\section{0pt}{.5\baselineskip}{.5\baselineskip}
\titleformat{\subsection}[hang]{\reset@font\normalsize\bfseries}{\thesubsection~}{0pt}{}
\titlespacing\subsection{0pt}{.5\baselineskip}{.5\baselineskip}
\titleformat{\subsubsection}[hang]{\reset@font\normalsize\bfseries}{\thesubsubsection~}{0pt}{}
\titlespacing\subsubsection{0pt}{.5\baselineskip}{.5\baselineskip}
\titleformat{\paragraph}[hang]{\reset@font\normalsize}{\thesection~}{0pt}{}
\titlespacing\paragraph{0pt}{.5\baselineskip}{.5\baselineskip}

%==============================================================================
% Redefinição do conteúdo das listas de figuras e tabelas
%==============================================================================
\counterwithout{figure}{chapter} %contador figure sequencial no documento inteiro
\counterwithout{table}{chapter}  %contador table  sequencial no documento inteiro
\def\fnumx@figure{\thefigure}
\def\fnumx@table{\thetable}

\newif\if@captionlisting\@captionlistingtrue
\long\def\@caption#1[#2]#3{%
  \par
  \setstretch{1}
  \if@captionlisting%
    \addcontentsline{\csname ext@#1\endcsname}{#1}%
        {\protect\numberline{\csname fnumx@#1\endcsname}{\ignorespaces #2}}%
  \fi%
  \begingroup
    \@parboxrestore
    \if@minipage
      \@setminipage
    \fi
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup%
}
\renewcommand*{\l@figure}{\@dottedtocline{1}{0em}{1.5em}}
\let\l@table\l@figure

%==============================================================================
% Ajuste das legendas das figuras e tabelas
%
% Utilizar \caption{} antes do elemento para descrever o que está sendo
% apresentado, e \fonte{} depois do elemento para citar a fonte de informação.
%==============================================================================
\captiondelim{ -- }
\setlength{\abovecaptionskip}{4pt}
\setlength{\belowcaptionskip}{4pt}

\captionnamefont{\bfseries\footnotesize}
\captiontitlefont{\bfseries\footnotesize}
\captionstyle{\centering}

% Comando para citar a fonte de figuras e tabelas
\newcommand{\fonte}[1]{%
  \captiontitlefont{\footnotesize}%
  \legend{\sourcename: #1}
}

%==============================================================================
% Redefinição do formato de citações longas
%==============================================================================
\renewenvironment{quote}{%
  \par
  \begin{list}{}{\setlength{\leftmargin}{40mm}\item\small}
  \setstretch{1}
}{%
  \par
  \end{list}{}
}

%==============================================================================
% Ajuste do espaçamento entre itens em 'enumerate', 'itemize' e 'description'
%==============================================================================
\renewenvironment{enumerate}{%
  \begin{list}{\arabic{enumi}.}{\topsep=6pt\itemsep=2pt\parsep=0pt\partopsep=0pt\usecounter{enumi}}%
}{\end{list}}

\renewenvironment{itemize}{%
  \begin{list}{\bfseries\upshape $\bullet$}{\topsep=6pt\itemsep=2pt\parsep=0pt\partopsep=0pt}%
}{\end{list}}

\renewenvironment{description}{
  \begin{list}{}{\topsep=6pt\itemsep=2pt\parsep=0pt\partopsep=0pt \labelwidth\z@ \itemindent-\leftmargin \let\makelabel\descriptionlabel}
}{\end{list}}

%==============================================================================
% Alias para citações no estilo natbib
%==============================================================================
\let\citep\cite
\let\citet\citeonline

%==============================================================================
% Páginas preliminares opcionais
%==============================================================================
\newenvironment{dedicatoria}{
  \clearpage%
  \mbox{}\vfill\begin{flushright}\begin{itshape}%
}{
  \end{itshape}\end{flushright}%
  \addvspace{5cm}%
}

\newenvironment{agradecimentos}{
  \chapter*{Agradecimentos}
}{}

\newenvironment{epigrafe}{
  \clearpage%
  \mbox{}\vfill%
  \begin{list}{}{\setlength{\leftmargin}{40mm}\item}
  \setstretch{1}
}{
  \end{list}%
  \addvspace{5cm}%
}

