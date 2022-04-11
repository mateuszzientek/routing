{extends file="main.tpl"}

{block name=content}
 <section>
	<form form action="{$conf->action_url}login" method="post">
									<div class="fields">
										<div class="field half">
											<label for="id_login">Podaj login</label>
											<input type="text" name="login" id="id_login"  />
										</div>
										<div class="field half">
											<label for="id_pass">Podaj haslo</label>
											<input type="password" name="pass" id="id_pass" />
										</div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="Zaloguj" class="primary" /></li>
									</ul>
								</form>
                            </section>
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