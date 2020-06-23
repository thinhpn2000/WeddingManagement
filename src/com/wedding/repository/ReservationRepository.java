package com.wedding.repository;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.google.gson.Gson;
import com.wedding.databaseconnection.MySqlConnection;
import com.wedding.models.Lobby;
import com.wedding.models.Reservation;
import com.wedding.utils.APIConstant;

public class ReservationRepository {
	Gson gson = new Gson();

	public void add(Reservation reservation) {
		String json = convertReservationToJSON(reservation);
		System.out.println(json);
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost req = new HttpPost(APIConstant.API_reservation_add);
		req.setEntity(new StringEntity(json, "UTF-8"));

		try {
			CloseableHttpResponse res = httpClient.execute(req);
			// get content res
			HttpEntity respEntity = res.getEntity();
			if (respEntity != null) {
				String content = EntityUtils.toString(respEntity);
				System.out.println(content);
			}

		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public String convertReservationToJSON(Reservation reservation) {
		return gson.toJson(reservation);
	}

}
