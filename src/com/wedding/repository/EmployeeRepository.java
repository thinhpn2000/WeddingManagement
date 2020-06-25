package com.wedding.repository;

import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.wedding.databaseconnection.MySqlConnection;
import com.wedding.models.Employee;
import com.wedding.utils.APIConstant;

public class EmployeeRepository {
	Gson gson = new Gson();

	public List<Employee> getAll() {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpGet req = new HttpGet(APIConstant.API_employee_get);
		try {
			CloseableHttpResponse res = httpClient.execute(req);
			HttpEntity entity = res.getEntity();
			String json = EntityUtils.toString(entity, "UTF-8");
			return convertJSONToListEmployee(json);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<Employee> convertJSONToListEmployee(String json) {
		Type typeListEmployee = new TypeToken<ArrayList<Employee>>() {
		}.getType();
		return gson.fromJson(json, typeListEmployee);
	}

	public void add(Employee employee) {
		String json = gson.toJson(employee);
		System.out.println(json);
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost req = new HttpPost(APIConstant.API_employee_add);
		req.setEntity(new StringEntity(json, "UTF-8"));
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
		System.out.println(id);
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpDelete req = new HttpDelete(APIConstant.API_employee_delete + "?id=" + id);
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

	public void update(Employee employee) {
		String json = gson.toJson(employee);
		System.out.println(json);
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPut req = new HttpPut(APIConstant.API_employee_update);
		req.setEntity(new StringEntity(json, "UTF-8"));
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

	public void reset(int id) {
		System.out.println(id);
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPut req = new HttpPut(APIConstant.API_employee_resetpassword + "?id=" + id);
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

	public String[] getAllUsername() {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpGet req = new HttpGet(APIConstant.API_employee_username);
		try {
			CloseableHttpResponse res = httpClient.execute(req);
			HttpEntity entity = res.getEntity();
			String json = EntityUtils.toString(entity, "UTF-8");
			return gson.fromJson(json, String[].class);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public boolean checkUsername(String email) {
		String[] listUsername = getAllUsername();
		for (String username : listUsername) {
			if (email.equals(username)) {
				return true;
			}
		}
		return false;
	}
	
	public void changePassword(String password, int userID) {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPut req = new HttpPut(APIConstant.API_employee_changepassword + "?id=" + userID);
		try {
			req.setEntity(new StringEntity(password, "UTF-8"));
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
