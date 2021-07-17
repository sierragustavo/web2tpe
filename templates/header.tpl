<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" main-content="width=device-width, initial-scale=1.0">
    <title>The Innkeeper</title>
    <link rel="stylesheet" href="{$base_url}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/1.0.18/vue.min.js"></script>
</head>

<body>
    {if $is_admin == 1}
        <input hidden id='admin' value=1 >
    {else}
        <input hidden id='admin' value=0>
    {/if}
    
    {include 'templates/nav.tpl'}