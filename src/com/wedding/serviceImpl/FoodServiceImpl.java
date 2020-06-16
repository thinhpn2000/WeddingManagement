package com.wedding.serviceImpl;

import java.util.List;

import com.wedding.models.Food;
import com.wedding.repository.FoodRepository;
import com.wedding.service.FoodService;

public class FoodServiceImpl implements FoodService {
	
	private FoodRepository foodRepository;
	
	public FoodServiceImpl() {
		foodRepository = new FoodRepository();
	}

	@Override
	public List<Food> getAllFood() {
		return foodRepository.getAll();
	}
	
	@Override
	public void addFood(Food food) {
		foodRepository.add(food);
		
	}

	@Override
	public void deleteFood(int id) {
		foodRepository.delele(id);
		
	}

	@Override
	public void updateFood(Food foodToUpdate) {
		foodRepository.update(foodToUpdate);
	}
}
