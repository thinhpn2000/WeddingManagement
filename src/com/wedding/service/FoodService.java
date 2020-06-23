package com.wedding.service;

import java.util.List;

import com.wedding.models.Food;

public interface FoodService {
	void addFood(Food food);
	void deleteFood(int id);
	public List<Food> getAllFood();
	public List<Food> removeFood(List<Food> listReservedFood);
	void updateFood(Food food);
}