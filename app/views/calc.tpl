{extends file="main.tpl"}

{block name=content}
<div id="wrapper">
<header id="header" class="alt">
<a href="{$conf->action_url}logout"  class="pure-menu-heading pure-menu-link">wyloguj</a>
</header>
 <section>
	<form form action="{$conf->action_root}calcCompute" method="post">
									<div class="fields">
										<div class="field half">
											<label for="kwota">Podaj kwote</label>
											<input type="text" name="kwota" id="kwota"  />
										</div>
										<div class="field half">
											<label for="lata">Podaj ilosc lat</label>
											<input type="text" name="lata" id="lata" />
										</div>
										<div class="field half">
											<label for="opr">Podaj oprocentowanie</label>
											<input type="text" name="opr" id="opr" />
										</div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="Oblicz" class="primary" /></li>
										<li><input type="reset" value="Wyczysc" /></li>
									</ul>
								</form>
                            </section>
</div>
<section class="split">
<section>
<div class="contact-method">
                                      									
{if $msgs->isError()}
	<h4>Wystąpiły błędy: </h4>
	<ol>
	{foreach $msgs->getErrors() as $err}
	{strip}
		<li>{$err}</li>
	{/strip}
	{/foreach}
	</ol>
{/if}


{if $msgs->isInfo()}
	<h4>Informacje: </h4>
	<ol >
	{foreach $msgs->getInfos() as $inf}
	{strip}
		<li>{$inf}</li>
	{/strip}
	{/foreach}
	</ol>
{/if}

{if isset($result->result)}
	<h4>Wynik</h4>
	<p>
	{$result->result} zł
	</p>
{/if}
</div>                             
</section>									
</section>


{/block}