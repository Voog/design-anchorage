<div class="product-item-details">
  {%- if menu_level.layout_title == product_list_layout -%}
    <a class="visible" href="{{ menu_level.url }}">
      {{ "look_closer" | lc | escape_once }}
    </a>
  {%- else -%}
    {% capture look_closer_btn %}
      <a class="product-item-btn{%- if _buyButton.product.price == blank or _buyButton.available? == false %} visible{%- endif -%}" href="{{ menu_level.url }}">
        {{ "look_closer" | lc | escape_once }}
      </a>
    {% endcapture %}

    {%- if _buyButton.product != blank and _buyButton.available? -%}
      <div class="item-details details-btn">
        {%- if _buyButton.product.uses_variants == true -%}
          {{ look_closer_btn }}
          <div class="product-item-price">
            {%- if _buyButton.product.price_max_with_tax != _buyButton.product.price_min_with_tax -%}
              {{ _buyButton.product.price_min_with_tax | money_with_currency: _buyButton.product.currency }}
              <span>— </span>
            {%- endif -%}
            {{ _buyButton.product.price_max_with_tax | money_with_currency: _buyButton.product.currency }}
          </div>
        {%- else -%}
          {%- if editmode or buy_button.product.out_of_stock? -%}
            {{ look_closer_btn }}
          {%- else -%}
            <button class="product-item-btn js-cart-btn p-abs" data-product-id="{{ _buyButton.product.id }}">{{ "add_to_cart" | lc | escape_once }}</button>
          {%- endif -%}
          <div class="product-item-price">
            <span>
              {{ _buyButton.product.price_with_tax | money_with_currency: _buyButton.product.currency }}
            </span>
          </div>
        {%- endif -%}
        </div>
    {%- else -%}
      <div class="item-details">
        {{ look_closer_btn }}
      </div>
    {%- endif -%}
  {%- endif -%}
</div>
