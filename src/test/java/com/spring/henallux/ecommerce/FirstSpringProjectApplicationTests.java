package com.spring.henallux.ecommerce;

import com.spring.henallux.ecommerce.Model.Order;
import com.spring.henallux.ecommerce.Model.User;
import com.spring.henallux.ecommerce.dataAccess.entity.OrderEntity;
import org.dozer.DozerBeanMapper;
import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.assertThat;
class FirstSpringProjectApplicationTests {
	@Test
	void test() {
		Order order = new Order();
		order.setDate("2020-01-01");
		order.setOrderStatus("En cours");
		order.setUserId(new User(1, "therry@msn.com", "123456", "123456", "Therry", "Therry", "Rue de la gare", "0477777777", "ROLE_USER", true, true, true, true));
		order.setId(1);
		order.setPaypalOrderId("2");
		DozerBeanMapper mapper = new DozerBeanMapper();
		OrderEntity orderEntity = mapper.map(order, OrderEntity.class);
		assertThat(orderEntity).isNotNull();
		assertThat(orderEntity.getId()).isEqualTo(1);
		assertThat(orderEntity.getPaypalOrderId()).isEqualTo("2");
		assertThat(orderEntity.getOrderStatus()).isEqualTo("En cours");
		assertThat(orderEntity.getUserId().getId()).isEqualTo(1);
		assertThat(orderEntity.getDate()).isEqualTo("2020-01-01");
	}

}
