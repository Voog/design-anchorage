<div class="product-item-details">
  {% capture look_closer_btn %}
    <a class="product-item-btn" href="{{ menu_level.url }}">
      {{ "look_closer" | lc | escape_once }}
    </a>
  {% endcapture %}

  {%- if _buyButton.available? -%}
    <div class="item-details details-btn">
      {%- if _buyButton.product.uses_variants == true -%}
        {{ look_closer_btn }}
        <div class="product-item-price">
          {%- capture original_price -%}
            {%- if _buyButton.product.price_max_with_tax != _buyButton.product.price_min_with_tax -%}
              {{ _buyButton.product.price_min_with_tax | money_with_currency: _buyButton.product.currency }}
              <span> – </span>
            {%- endif -%}
            {{ _buyButton.product.price_max_with_tax | money_with_currency: _buyButton.product.currency }}
          {%- endcapture -%}

          <div class="product-price">
            {% if _buyButton.product.on_sale? %}
              <s class="product-price-original">
                {{- original_price -}}
              </s>
            {% endif %}

            <span class="product-price-final">
              {%- if _buyButton.product.on_sale? -%}
                {% if _buyButton.product.effective_price_min_with_tax != _buyButton.product.effective_price_max_with_tax %}
                  {{- _buyButton.product.effective_price_min_with_tax | money_with_currency: _buyButton.product.currency -}}
                  <span> – </span>
                {%- endif -%}
                {{- _buyButton.product.effective_price_max_with_tax | money_with_currency: _buyButton.product.currency -}}
              {%- else -%}
                {{- original_price -}}
              {%- endif -%}
            </span>
          </div>
        </div>
      {%- else -%}
        {%- if editmode or _buyButton.product.out_of_stock? -%}
          {{ look_closer_btn }}
        {%- else -%}
          <button class="product-item-btn js-cart-btn p-abs" data-product-id="{{ _buyButton.product.id }}">{{ "add_to_cart" | lc | escape_once }}</button>
        {%- endif -%}
        <div class="product-item-price">
          <span>
            {%- if _buyButton.product.on_sale? -%}
              <s class="product-price-original">
                {{ _buyButton.product.price_min_with_tax | money_with_currency: _buyButton.product.currency }}
              </s>
            {%- endif -%}
            <span class="product-price-final">
              {{- _buyButton.product.effective_price_min_with_tax | money_with_currency: _buyButton.product.currency -}}
            </span>
          </span>
        </div>
      {%- endif -%}
      </div>
  {%- else -%}
    <div class="item-details">
      {{ look_closer_btn }}
    </div>
  {%- endif -%}
</div>
