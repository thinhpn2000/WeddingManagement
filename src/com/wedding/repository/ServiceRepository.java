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
import com.wedding.models.Service;
import com.wedding.utils.APIConstant;

public class ServiceRepository {
	private Gson gson = new Gson();
	public List<Service> getAll() {
		CloseableHttpClient httpClient = HttpClients.createDefault();
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
	
	public void add(Service service) {
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
	
	public void delele(int id) {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpDelete req = new HttpDelete(APIConstant.API_service_delete + "?id=" + id);
		try {
			CloseableHttpResponse res = httpClient.execute(req);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void update(Service service) {
		String json = convertServiceToJSON(service);
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
	
	public String convertServiceToJSON(Service service) {
		return gson.toJson(service);
	}
	
	public List<Service> convertJSONToListService(String json) {
		Type typeListService = new TypeToken<ArrayList<Service>>() {}.getType();
		return gson.fromJson(json, typeListService);
	}
}
