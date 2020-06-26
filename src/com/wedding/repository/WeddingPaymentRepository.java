package com.wedding.repository;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.wedding.models.UpdatePayment;
import com.wedding.models.WeddingPayment;
import com.wedding.utils.APIConstant;

public class WeddingPaymentRepository {
	Gson gson = new Gson();
	public List<WeddingPayment> getAll() {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpGet req = new HttpGet(APIConstant.API_reservation);
		try {
			CloseableHttpResponse res = httpClient.execute(req);
			HttpEntity entity = res.getEntity();
			String json = EntityUtils.toString(entity, "UTF-8");
			return convertJsonToListWedding(json);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	public WeddingPayment getById(int id) {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpGet req = new HttpGet(APIConstant.API_reservation + "?id=" + id);
		try {
			CloseableHttpResponse res = httpClient.execute(req);
			HttpEntity entity = res.getEntity();
			String json = EntityUtils.toString(entity, "UTF-8");
			//System.out.println(json);
			return convertJsonToWedding(json);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	public void update(UpdatePayment updatePayment) {
		String json = gson.toJson(updatePayment);
		HttpPut req = new HttpPut(APIConstant.API_reservation_update);
		req.setEntity(new StringEntity(json, "UTF-8"));
		
		CloseableHttpClient httpClient = HttpClients.createDefault();
		try {
			httpClient.execute(req);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void delete(int id) {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpDelete req = new HttpDelete(APIConstant.API_reservation_delete + "?id=" + id);
		try {
			httpClient.execute(req);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public WeddingPayment convertJsonToWedding(String json) {
		return gson.fromJson(json, WeddingPayment.class);
	}
	
	public List<WeddingPayment> convertJsonToListWedding(String json) {
		Type typeListWedding = new TypeToken <ArrayList<WeddingPayment>>() {}.getType();
		return gson.fromJson(json, typeListWedding);
	}
	public void pay(int id, int userID) {
		HttpPut req = new HttpPut(APIConstant.API_reservation_pay + "?id=" + id);
		//String stringUserID = String.
		CloseableHttpClient httpClient = HttpClients.createDefault();
		try {
			req.setEntity(new StringEntity(Integer.toString(userID),"UTF-8"));
			httpClient.execute(req);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
