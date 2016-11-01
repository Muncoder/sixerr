<!-- 		<%= form_for([@service, @service.orders.new]) do |f| %>
			<%= f.hidden_field :service_id, value: @service.id %>
			<%= f.hidden_field :price, value: @service.price %>

			<center>
				<%= f.submit "Order Now ($#{@service.price})", class: "btn btn-primary btn-lg btn-order" %>
			</center> -->
