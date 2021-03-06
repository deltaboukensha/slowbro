{*
Copyright 2011-2016 Nick Korbel

Translation: 2014 Nicola Ruggero <nicola@nxnt.org>

This file is part of Booked Scheduler.

Booked Scheduler is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Booked Scheduler is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Booked Scheduler.  If not, see <http://www.gnu.org/licenses/>.
*}


Dettagli prenotazione:
<br />
<br />

Utente: {$UserName}<br />
{if !empty($CreatedBy)}
	Creato da: {$CreatedBy}
	<br />
{/if}
Inizio: {formatdate date=$StartDate key=reservation_email}<br />
Fine: {formatdate date=$EndDate key=reservation_email}<br />
{if $ResourceNames|count > 1}
	Risorse:
	<br />
	{foreach from=$ResourceNames item=resourceName}
		{$resourceName}
		<br />
	{/foreach}
{else}
	Risorsa: {$ResourceName}
	<br />
{/if}

{if $ResourceImage}
	<div class="resource-image"><img src="{$ScriptUrl}/{$ResourceImage}"/></div>
{/if}

Note: {$Title}<br />
Descrizione: {$Description}<br />

{if count($RepeatDates) gt 0}
	<br />
	La prenotazione si ripete nelle seguenti date:
	<br />
{/if}

{foreach from=$RepeatDates item=date name=dates}
	{formatdate date=$date}
	<br />
{/foreach}

{if $Accessories|count > 0}
	<br />
	Accessori:
	<br />
	{foreach from=$Accessories item=accessory}
		({$accessory->QuantityReserved}) {$accessory->Name}
		<br />
	{/foreach}
{/if}

{if $Attributes|count > 0}
	<br />
	{foreach from=$Attributes item=attribute}
		<div>{control type="AttributeControl" attribute=$attribute readonly=true}</div>
	{/foreach}
{/if}

{if $RequiresApproval}
	<br />
    E' stata inserita una nuova prenotazione. RimarrĂ  in sospeso fino all'approvazione.
{/if}

<br />
<br />
<a href="{$ScriptUrl}/{$ReservationUrl}">Vedi questa prenotazione</a> | <a href="{$ScriptUrl}">Accedi a Booked Scheduler</a>

