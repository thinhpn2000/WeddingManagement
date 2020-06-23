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
import com.wedding.models.Service;
import com.wedding.models.ServicePrice;
import com.wedding.utils.APIConstant;

public class ServiceRepository {
	private Gson gson = new Gson();
	// Call API in repository to get data from server.
	
	// Call API GET to get service data.
	public List<Service> getAll() {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		// create http request to call api
		HttpGet req = new HttpGet(APIConstant.API_service_get);
		try {
			CloseableHttpResponse res = httpClient.execute(req);
			HttpEntity entity = res.getEntity();
			String json = EntityUtils.toString(entity);
			return convertJSONToListService(json);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;

	}
	// Call API POST to add service.
	public void add(Service service) {
		
		// create http request to call api
		HttpPost req = new HttpPost(APIConstant.API_service_add);
		List<NameValuePair> urlParamaters = new ArrayList<>();
		urlParamaters.add(new BasicNameValuePair("serviceName", service.getServiceName()));
		urlParamaters.add(new BasicNameValuePair("servicePrice", Integer.toString(service.getServicePrice())));
		try {
			req.setEntity(new UrlEncodedFormEntity(urlParamaters, "UTF-8"));
			CloseableHttpClient httpClient = HttpClients.createDefault();
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
	// Call API DELETE to delete lobby.
	public void delele(int id) {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		// create http request to call api
		HttpDelete req = new HttpDelete(APIConstant.API_service_delete + "?id=" + id);
		try {
			CloseableHttpResponse res = httpClient.execute(req);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	// Call API PUT to update lobby.
	public void update(Service service) {
		String json = convertServiceToJSON(service);
		// create http request to call api
		HttpPut req = new HttpPut(APIConstant.API_service_update);
		try {
			req.setEntity(new StringEntity(json, "UTF-8"));
			CloseableHttpClient httpClient  = HttpClients.createDefault();
			CloseableHttpResponse res = httpClient.execute(req);
			HttpEntity respEntity = res.getEntity();
			if(respEntity != null){
				String content =  EntityUtils.toString(respEntity);
				System.out.println(content);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	// Convert object to JSON data.
	public String convertServiceToJSON(Service service) {
		return gson.toJson(service);
	}
	
	// Convert JSON data when call API GET to list Object.
	public List<Service> convertJSONToListService(String json) {
		Type typeListService = new TypeToken<ArrayList<Service>>() {}.getType();
		return gson.fromJson(json, typeListService);
	}
	
	public List<Service> removeService(List<ServicePrice> listReservedService) {
		List<Service> listService = getAll();
		
		for (int i = 0; i < listService.size(); i++) 
		{
			for(ServicePrice reservedService : listReservedService)
				if(listService.get(i).getServiceID() == reservedService.getServiceID()) {
					listService.remove(i);
					i--;
					break;
				}
					
		}
		return listService;
	}
}
