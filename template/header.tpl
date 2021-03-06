<!DOCTYPE html>
<html lang="{$lang_info.code}" dir="{$lang_info.direction}">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset={$CONTENT_ENCODING}">
    <meta name="generator" content="Piwigo (aka PWG), see piwigo.org">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
{if isset($meta_ref) }
{if isset($INFO_AUTHOR)}
    <meta name="author" content="{$INFO_AUTHOR|@strip_tags:false|@replace:'"':' '}">
{/if}
{if isset($related_tags)}
    <meta name="keywords" content="{foreach from=$related_tags item=tag name=tag_loop}{if !$smarty.foreach.tag_loop.first}, {/if}{$tag.name}{/foreach}">
{/if}
{if isset($COMMENT_IMG)}
    <meta name="description" content="{$COMMENT_IMG|@strip_tags:false|@replace:'"':' '}{if isset($INFO_FILE)} - {$INFO_FILE}{/if}">
{else}
    <meta name="description" content="{$PAGE_TITLE}{if isset($INFO_FILE)} - {$INFO_FILE}{/if}">
{/if}
{/if}

    <title>{if $PAGE_TITLE!=l10n('Home') && $PAGE_TITLE!=$GALLERY_TITLE}{$PAGE_TITLE} | {/if}{$GALLERY_TITLE}</title>
    <link rel="shortcut icon" type="image/x-icon" href="{$ROOT_URL}{$themeconf.icon_dir}/favicon.ico">
    <link rel="start" title="{'Home'|@translate}" href="{$U_HOME}" >
    <link rel="search" title="{'Search'|@translate}" href="{$ROOT_URL}search.php" >
{if isset($first.U_IMG)   }    <link rel="first" title="{'First'|@translate}" href="{$first.U_IMG}" >{/if}
{if isset($previous.U_IMG)}    <link rel="prev" title="{'Previous'|@translate}" href="{$previous.U_IMG}" >{/if}
{if isset($next.U_IMG)    }    <link rel="next" title="{'Next'|@translate}" href="{$next.U_IMG}" >{/if}
{if isset($last.U_IMG)    }    <link rel="last" title="{'Last'|@translate}" href="{$last.U_IMG}" >{/if}
{if isset($U_UP)          }    <link rel="up" title="{'Thumbnails'|@translate}" href="{$U_UP}" >{/if}

{combine_css path="themes/`$themeconf.name`/bootstrap/dist/css/bootstrap.min.css" order=-20}
{combine_css path="themes/`$themeconf.name`/bootstrap/dist/css/bootstrap-theme.min.css" order=-20}
{foreach from=$themes item=theme}
{if $theme.load_css}
    {combine_css path="themes/`$theme.id`/theme.css" order=-10}
{/if}
{if !empty($theme.local_head)}{include file=$theme.local_head load_css=$theme.load_css}{/if}
{/foreach}
{combine_css path="themes/`$themeconf.name`/fixplugins.css" order=1000000}
    {get_combined_css}

{if isset($U_PREFETCH)}    <link rel="prefetch" href="{$U_PREFETCH}">{/if}
{if isset($U_CANONICAL)}    <link rel="canonical" href="{$U_CANONICAL}">{/if}

{if not empty($page_refresh)}   <meta http-equiv="refresh" content="{$page_refresh.TIME};url={$page_refresh.U_REFRESH}">{/if}

{combine_script id='jquery'}
{combine_script id='jquery-ajaxmanager' require='jquery' path='themes/default/js/plugins/jquery.ajaxmanager.js'}
{combine_script id='thumbnails-loader' require='jquery-ajaxmanager' path='themes/default/js/thumbnails.loader.js'}
{combine_script id='bootstrap' require='jquery' path="themes/`$themeconf.name`/bootstrap/dist/js/bootstrap.min.js"}
{combine_script id=$themeconf.name require='bootstrap' path="themes/`$themeconf.name`/js/theme.js"}
    {get_combined_scripts load='header'}

    <!--[if lt IE 7]>
    <script type="text/javascript" src="{$ROOT_URL}themes/default/js/pngfix.js"></script>
    <![endif]-->

    {if not empty($head_elements)}
        {foreach from=$head_elements item=elt}{$elt}
        {/foreach}
    {/if}
</head>

<body id="{$BODY_ID}">
<!-- Bootstrap navbar, moved to the header as variables are missing in menubar.tpl, actual menus remain in menubar.tpl -->
<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menubar-navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">{$GALLERY_TITLE}</a>
        </div>
        <div class="collapse navbar-collapse navbar-right" id="menubar-navbar-collapse">
{$MENUBAR}
        </div>
    </div>
</nav>

{if !isset($slideshow)}
<div class="jumbotron">
    <div class="container">
        <div id="theHeader">{$PAGE_BANNER}</div>
    </div>
</div>
{/if}

{if not empty($header_msgs)}
{foreach from=$header_msgs item=msg}
{/foreach}
{/if}

{if not empty($header_notes)}
{foreach from=$header_notes item=note}
{/foreach}
{/if}
<!-- End of header.tpl -->