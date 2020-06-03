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
	public void addFood(Food food) {
		foodRepository.add(food);
		
	}

	@Override
	public void deleteFood(int id) {
		foodRepository.delele(id);
		
	}

	@Override
	public Food getFoodById(int id) {
		Food food = foodRepository.getByIDInFood(id);
		if(food != null) {
			if(food.getEndingDate() != null) {
				food = foodRepository.getByIDInUpdatedFood(id);
				food.setFromUpdatedFood(true);
				return food;
			}
			return food;
		}
		return null;
	}

	@Override
	public List<Food> getAllFood() {
		return foodRepository.getAll();
	}

	@Override
	public void updateFood(Food foodToUpdate) {
		Food food = getFoodById(foodToUpdate.getFoodID());
		if(food != null) {
			if(food.getFoodPrice() == foodToUpdate.getFoodPrice()) {
				foodRepository.updateOthersInFood(foodToUpdate);
			} else if(food.isFromUpdatedFood() && (food.getFoodPrice() != foodToUpdate.getFoodPrice())) {
				foodRepository.updateHasPriceInUpdatedFood(foodToUpdate);
			} else {
				foodRepository.updateHasPriceInFood(foodToUpdate);
			}
		}
	}

}
