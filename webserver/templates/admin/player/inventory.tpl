{include file="../_header.tpl"}

<div class="container" charid={$character->id}>
	<div class="row" style="margin-top:60px;">

    <div class="row">
      <div class="col-md-12">
        <ul class="breadcrumb">
          <li><a href="/admin/player/">Player</a></li>
          <li><a href="/admin/player/search">Search</a> - <a href="/admin/player/inventory/{$character->id}">{$character->name}</a></li>
          <li class="active">Inventory</li>
        </ul>
      </div>
    </div>
    
    <div class="col-md-3">
      <ul class="nav nav-tabs">
        <li class="active"><a href="#itemsearch" data-toggle="tab" aria-expanded="true"><i class="glyphicon glyphicon-search"></i> Item Search</a></li>
        <li class=""><a href="#bundle" data-toggle="tab" aria-expanded="false"><i class="glyphicon glyphicon-duplicate"></i> Bundles</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane fade active in" id="itemsearch">

          <div class="panel panel-default">
            <div class="panel-body">
              <div class="form-group">
                <div class="input-group item-search">
                  <input type="text" class="form-control" name="q" placeholder="Cloth Gloves" id="q">
                  <span class="input-group-btn">
                    <a id="search-button" onclick="FindItem();"><button class="btn btn-default" type="button">Search</button></a>
                  </span>
                </div>
              </div>
                <p></p>
              <div class="list-group findslots slotarea fade" unselectable="on">

             
              </div>
              <div class="item-pagination">
              </div>
            </div>
          </div>

        </div>
        <div class="tab-pane fade" id="bundle">

          <div class="panel panel-default">
            <div class="panel-body">
              <div class="list-group bundleslots slotarea" unselectable="on">
                <span>No Bundle Slots Loaded.</span>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
    

    <div class="col-md-5">
      <ul class="nav nav-tabs">
        <li class="active"><a href="#inventory" data-toggle="tab" aria-expanded="true"><i class="glyphicon glyphicon-th"></i> Inventory</a></li>
        <li class=""><a href="#bank" data-toggle="tab" aria-expanded="false"><i class="glyphicon glyphicon-piggy-bank"></i> Bank</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane fade active in" id="inventory">

          <div class="panel panel-default">
            <div class="panel-body">

              <div class="item-inventory col-md-6" style="padding: 0px 5px">
                 <div class="panel panel-default">
                  <div class="panel-heading">Equipment</div>

                    <div class="panel-body slotarea equipment-border" unselectable="on">

                      <span class="slot1 slotdrop" slot-id="1" slot-name="Left Ear" data-mask="18"></span>
                      <span class="slot2 slotdrop" slot-id="2" slot-name="Head" data-mask="4"></span>
                      <span class="slot3 slotdrop" slot-id="3" slot-name="Mask" data-mask="8"></span>
                      <span class="slot4 slotdrop" slot-id="4" slot-name="Right Ear" data-mask="18"></span>
                      <br><br>
                      <span class="slot17 slotdrop" slot-id="17" slot-name="Chest" data-mask="131072"></span>
                      <span class="slot-spacer"></span>
                      <span class="slot-spacer"></span>
                      <span class="slot5 slotdrop" slot-id="5" slot-name="Neck" data-mask="32"></span>
                      <br><br>
                      <span class="slot7 slotdrop" slot-id="7" slot-name="Arms" data-mask="128"></span>
                      <span class="slot-spacer"></span>
                      <span class="slot-spacer"></span>
                      <span class="slot8 slotdrop" slot-id="8" slot-name="Back" data-mask="256"></span>
                      <br><br>
                      <span class="slot20 slotdrop" slot-id="20" slot-name="Waist" data-mask="1048576"></span>
                      <span class="slot-spacer"></span>
                      <span class="slot-spacer"></span>
                      <span class="slot6 slotdrop" slot-id="6" slot-name="Shoulder" data-mask="64"></span>
                      <br><br>
                      <span class="slot9 slotdrop" slot-id="9" slot-name="Left Bracer" data-mask="1536"></span>
                      <span class="slot-spacer"></span>
                      <span class="slot-spacer"></span>
                      <span class="slot10 slotdrop" slot-id="10" slot-name="Right Bracer" data-mask="1536"></span>
                      <br><br>
                      <span class="slot18 slotdrop" slot-id="18" slot-name="Legs" data-mask="262144"></span>
                      <span class="slot12 slotdrop" slot-id="12" slot-name="Hands" data-mask="4096"></span>
                      <span class="slot0 slotdrop" slot-id="0" slot-name="Charm" data-mask="1"></span>
                      <span class="slot19 slotdrop" slot-id="19" slot-name="Feet" data-mask="524288"></span>
                      <br><br>
                      <span class="slot-spacer"></span>
                      <span class="slot15 slotdrop" slot-id="15" slot-name="Left Ring" data-mask="98304"></span>
                      <span class="slot16 slotdrop" slot-id="16" slot-name="Right Ring" data-mask="98304"></span>
                      <span class="slot9999 slotdrop" slot-id="9999" slot-name="Power Source" data-mask="4194304"></span>  
                      <br><br>
                      <span class="slot13 slotdrop" slot-id="13" slot-name="Primary" data-mask="8192"></span>
                      <span class="slot14 slotdrop" slot-id="14" slot-name="Secondary" data-mask="16384"></span>
                      <span class="slot11 slotdrop" slot-id="11" slot-name="Range" data-mask="2048"></span>
                      <span class="slot21 slotdrop" slot-id="21" slot-name="Ammo" data-mask="2097152"></span>

                  </div>
                </div>
              </div>
              <div class="item-bags col-md-3" style="padding: 0px">

               

                <div class="panel panel-default">
                  <div class="panel-heading">Inventory</div>

                    <div class="panel-body slotarea" unselectable="on"  style="padding: 10px">
                      <span class="slot22 slotdrop" slot-id="22" slot-name="Inventory"></span>
                      <span class="slot26 slotdrop" slot-id="26" slot-name="Inventory"></span>
                      <br><br>
                      <span class="slot23 slotdrop" slot-id="23" slot-name="Inventory"></span>
                      <span class="slot27 slotdrop" slot-id="27" slot-name="Inventory"></span>
                      <br><br>
                     <span class="slot24 slotdrop" slot-id="24" slot-name="Inventory"></span>
                      <span class="slot28 slotdrop" slot-id="28" slot-name="Inventory"></span>
                      <br><br>
                      <span class="slot25 slotdrop" slot-id="25" slot-name="Inventory"></span>
                      <span class="slot29 slotdrop" slot-id="29" slot-name="Inventory"></span>
                      <br><br>
                       
                  </div>
                </div>
                 <div class="panel panel-default item-destroy">
                  <div class="panel-heading">Destroy</div>

                    <div class="panel-body slotarea destroy-border" unselectable="on">

                    <span class="slot slotdrop" slot-id="-1" slot-name="Destroy"></span>

                  </div>
                </div>
              </div>
              <div class="item-bags col-md-3" style="padding: 0px 0px 0px 5px"> 

                {$counter = 0}
                {$bag = 1}
                {for $i=251 to 330}
                  {$counter = $counter + 1}
                  
                  {if $counter == 1}
                  <div class="bag{$bag+21} panel panel-default" style="display: none">
                    <div class="panel-heading">Bag {$bag}</div>
                    <div class="panel-body" style="padding: 10px">
                  {/if}

                  <span class="slot{$i} slot slotdrop" slot-id="{$i}" slot-name="Bag {$bag}-{$counter}"></span>
                  
                  {*if ($i % 2) == 0}<br><br>{/if*}
                  
                  {if $counter == 10}
                    </div>
                  </div>
                  
                  {$counter = 0}
                  {$bag = $bag + 1}
                  {/if}
                  
                {/for}
              </div>

            </div>
          </div>
        </div>

        <div class="tab-pane fade" id="bank">

            <div class="panel panel-default">
              <div class="panel-body">

                <div class="col-md-8 bank-border"> 
                  <div class="panel panel-default">
                    <div class="panel-heading">Bank</div>
                 
                    <div class="panel-body slotarea" unselectable="on" style="padding: 30px 0px 30px 20px">

                        <span class="slot2000 slot slotdrop ui-droppable" slot-id="2000" slot-name="Bank"></span>
                        <span class="slot2004 slot slotdrop ui-droppable" slot-id="2004" slot-name="Bank"></span>
                        <span class="slot2008 slot slotdrop ui-droppable" slot-id="2008" slot-name="Bank"></span>
                        <span class="slot2012 slot slotdrop ui-droppable" slot-id="2012" slot-name="Bank"></span>
                        <span class="slot2016 slot slotdrop ui-droppable" slot-id="2016" slot-name="Bank"></span>
                        <span class="slot2020 slot slotdrop ui-droppable" slot-id="2020" slot-name="Bank"></span>
                        {*<span class="slot2024 slot slotdrop ui-droppable" slot-id="2024" slot-name="Bank"></span>
                        <span class="slot2028 slot slotdrop ui-droppable" slot-id="2028" slot-name="Bank"></span>*}
                        <br><br>
                        <span class="slot2001 slot slotdrop ui-droppable" slot-id="2001" slot-name="Bank"></span>
                        <span class="slot2005 slot slotdrop ui-droppable" slot-id="2005" slot-name="Bank"></span>
                        <span class="slot2009 slot slotdrop ui-droppable" slot-id="2009" slot-name="Bank"></span>
                        <span class="slot2013 slot slotdrop ui-droppable" slot-id="2013" slot-name="Bank"></span>
                        <span class="slot2017 slot slotdrop ui-droppable" slot-id="2017" slot-name="Bank"></span>
                        <span class="slot2021 slot slotdrop ui-droppable" slot-id="2021" slot-name="Bank"></span>
                        {*<span class="slot2025 slot slotdrop ui-droppable" slot-id="2025" slot-name="Bank"></span>
                        <span class="slot2029 slot slotdrop ui-droppable" slot-id="2029" slot-name="Bank"></span>*}
                        <br><br>
                        <span class="slot2002 slot slotdrop ui-droppable" slot-id="2002" slot-name="Bank"></span>
                        <span class="slot2006 slot slotdrop ui-droppable" slot-id="2006" slot-name="Bank"></span>
                        <span class="slot2010 slot slotdrop ui-droppable" slot-id="2010" slot-name="Bank"></span>
                        <span class="slot2014 slot slotdrop ui-droppable" slot-id="2014" slot-name="Bank"></span>
                        <span class="slot2018 slot slotdrop ui-droppable" slot-id="2018" slot-name="Bank"></span>
                        <span class="slot2022 slot slotdrop ui-droppable" slot-id="2022" slot-name="Bank"></span>
                        {*<span class="slot2026 slot slotdrop ui-droppable" slot-id="2026" slot-name="Bank"></span>
                        <span class="slot2030 slot slotdrop ui-droppable" slot-id="2030" slot-name="Bank"></span>*}
                        
                        <br><br>

                        <span class="slot2003 slot slotdrop ui-droppable" slot-id="2003" slot-name="Bank"></span>
                        <span class="slot2007 slot slotdrop ui-droppable" slot-id="2007" slot-name="Bank"></span>
                        <span class="slot2011 slot slotdrop ui-droppable" slot-id="2011" slot-name="Bank"></span>
                        <span class="slot2015 slot slotdrop ui-droppable" slot-id="2015" slot-name="Bank"></span>
                        <span class="slot2019 slot slotdrop ui-droppable" slot-id="2019" slot-name="Bank"></span>
                        <span class="slot2023 slot slotdrop ui-droppable" slot-id="2023" slot-name="Bank"></span>
                        {*<span class="slot2027 slot slotdrop ui-droppable" slot-id="2027" slot-name="Bank"></span>
                        <span class="slot2031 slot slotdrop ui-droppable" slot-id="2031" slot-name="Bank"></span>*}
                        <br><br>
                    </div>
                  </div>
                </div>
                
                <div class="col-md-4">
                  {$counter = 0}
                  {$bag = 2000}
                  {for $i=2031 to 2293}
                    {if $i == 2041 || $i == 2052 || $i == 2061 || $i == 2074 || $i == 2085
                    || $i == 2096 || $i == 2107 || $i == 2118 || $i == 2329 || $i == 2140 || $i == 2152 || $i == 2162 || $i == 2173 || $i == 2184 || $i == 2195 || $i == 2206 || $i == 2217 || $i == 2228 || $i == 2239 || $i == 2250 || $i == 2261 || $i == 2272 || $i == 2283}{continue}{/if}
                    
                    {$counter = $counter + 1}

                    
                    {if $counter == 1}
                    <div class="bag{$bag} panel panel-default" style="display: none">
                      <div class="panel-heading">Bag {$bag}</div>
                      <div class="panel-body">
                    {/if}

                    <span class="slot{$i} slot slotdrop" slot-id="{$i}" slot-name="Bank Bag {$bag}-{$counter}"></span>
                    
                    {if $counter == 10}
                    {if ($i % 2) == 0}<br><br>{/if}
                    
                      </div>
                    </div>
                    
                    {$counter = 0}
                    {$bag = $bag + 1}
                    {/if}
                    
                  {/for}
                  </div>
                    </div>
                </div>
                

              </div>
            </div>

        </div>

      </div>
    </div>
  <div class="col-md-4">

      <ul class="nav nav-tabs">
        <li class="active" id="li-details"><a id="details-tab" href="#details" data-toggle="tab" aria-expanded="true"><i class="glyphicon glyphicon-list-alt"></i> Details</a></li>
        <li id="li-changes"><a id="changes-tab" href="#changes" data-toggle="tab" aria-expanded="false"><i class="glyphicon glyphicon-sort-by-attributes"></i> Changes</a></li>
      </ul>

      <div class="tab-content">
        <div class="tab-pane fade active in" id="details">

          <div class="panel panel-default">
            <div class="panel-heading"><span id="details-name"></span></div>
            <div class="panel-body">
                <div class="input-group">
                  <label for="detail-quantity">Quantity</label>
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-default btn-number btn-sm" disabled="disabled" data-type="minus" data-field="quant[1]">
                            <span class="glyphicon glyphicon-minus"></span>
                        </button>
                    </span>
                    <input type="text" id="detail-quantity" class="form-control input-number input-sm" value="1" min="1" max="20">
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-default btn-number btn-sm" data-type="plus" data-field="quant[1]">
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>
                    </span>
                    
                </div>
                <div class="input-group">
                <div class="btn-group btn-block" role="group" id="save-btn">
                  <a onclick="AddBundle()">
                    <button type="button" class="btn btn-default btn-block">Add Bundle</button></a>
                  </div>
                </div>

            </div>
          </div>

        </div>

        <div class="tab-pane fade" id="changes">

          <div class="panel panel-default">
            <div class="panel-body">
              <div class="text-center" id="save-info">
              There are no changes pending.
              </div>
              <div class="changes-save text-left">
                  <div class="btn-group btn-block" role="group" id="save-btn">
                    <button data-toggle="modal" data-target="#save-confirm" type="button" class="btn btn-success btn-block" style="display:none">Apply <span class="badge">4</span> Changes</button>
                  </div>
                <div class="list-group" id="list-changes" unselectable="on" style="max-height: 388px; overflow: hidden; overflow-y: scroll;">

                </div>
              
              </div>
              
            </div>
          </div>

        </div>
      </div>


    </div>

  </div>

<div id="save-confirm" class="modal fade" role="dialog" data-backdrop="" unselectable="on">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Save Changes To Database</h4>
      </div>
      <div class="modal-body">
        <p id="saving-text">Are you sure you want to save changes?</p>
              <div class="list-group" id="event-progress" unselectable="on" style="max-height: 388px; overflow: hidden; overflow-y: scroll;">

              </div>
              <div class="text-left">
                  <div class="btn-group" role="group">
                    
                  </div>
              </div>
              
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" id="save-confirm-cancel-btn" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-primary" id="save-confirm-btn" onclick="SaveEventLog()">Save Changes</button>
      </div>
    </div>
  </div>
</div>


{*
  <script>
{if !empty($inventory)}
{foreach $inventory item=inv}
$('.slot{$inv->slotid}').append('<img item-id="{$inv->id}" item-name="{$inv->Name|replace:"'":"\'"}" item-icon="{$inv->icon}" slot-id="{$inv->slotid}" data-mask={$inv->slots} item-quantity={$inv->charges} class="draggable" id="findslot-{$inv->slotid}" src="/images/items/item_{$inv->icon}.gif" is-bag={if $inv->bagsize > 0}1{else}0{/if} bag-slots="{$inv->bagslots}" onclick="GetDetails(this)">');
{/foreach}
{/if}
</script>
*}

{*include file="../_footer.tpl"*}