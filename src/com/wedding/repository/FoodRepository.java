package com.wedding.repository;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.wedding.models.Food;
import com.wedding.utils.APIConstant;

public class FoodRepository {
	private Gson gson = new Gson();
	
	public List<Food> getAll() {
		// create a request by configure a TCP connection to server port 
		CloseableHttpClient httpClient = HttpClients.createDefault();
		// create a method with url is passed
		HttpGet request = new HttpGet(APIConstant.API_food_get);
		// execute this method
		try {
			CloseableHttpResponse res = httpClient.execute(request);
			// Read the response body.
			HttpEntity entity = res.getEntity();
			String result = EntityUtils.toString(entity);
			return convertJSONToListFood(result);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// notify successful connection and release this connection for other
			request.releaseConnection();
			//res.close();
		}
		return null;
	}
	
	public void add(Food food) {
		HttpPost req = new HttpPost(APIConstant.API_food_add);
		List<NameValuePair> urlParamaters = new ArrayList<>();
		// add obj include key and value 
		urlParamaters.add(new BasicNameValuePair("foodName", food.getFoodName()));
		urlParamaters.add(new BasicNameValuePair("foodPrice",Integer.toString(food.getFoodPrice())));
		urlParamaters.add(new BasicNameValuePair("foodNote", food.getFoodNote()));
		try {
			req.setEntity(new UrlEncodedFormEntity(urlParamaters,"UTF-8"));
			CloseableHttpClient httpClient = HttpClients.createDefault();
			// execute post method
			CloseableHttpResponse res = httpClient.execute(req);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void delele(int id) {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpDelete req = new HttpDelete(APIConstant.API_food_delete + "?id=" + id);
		try(CloseableHttpResponse res = httpClient.execute(req)) {
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void update(Food food) {
		String json = convertFoodToJSON(food);
		HttpPut req = new HttpPut(APIConstant.API_food_update);
		try {
			CloseableHttpClient httpClient = HttpClients.createDefault();
			req.setEntity(new StringEntity(json, "UTF-8"));
			CloseableHttpResponse res = httpClient.execute(req);
			// get content res
			HttpEntity respEntity = res.getEntity();
			if(respEntity != null){
				String content =  EntityUtils.toString(respEntity);
				System.out.println(content);
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Food> convertJSONToListFood(String json) {
		// declare data type is ArrayList<Food>
		Type typeListFood = new TypeToken<ArrayList<Food>>() {}.getType();
		// cast string json to ArrayList<Food>
		List<Food> listFood = gson.fromJson(json,typeListFood);
		return listFood;
	}
	
	public String convertFoodToJSON(Food food) {
		// cast Food to json
		String json = gson.toJson(food);
		return json;
	}
}
