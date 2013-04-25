package com.gzm.xm.common.util;

import java.io.IOException;
import java.text.SimpleDateFormat;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JsonUtils {

	private static final Logger LOGGER = LoggerFactory.getLogger( JsonUtils.class );
	private static ObjectMapper MAPPER;

	static {
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
		MAPPER = new ObjectMapper();
		MAPPER.setDateFormat( sdf );
	}

	public static String toJson( final Object pojo ) {
		try {
			return MAPPER.writeValueAsString( pojo );
		}
		catch( IOException e ) {
			LOGGER.error( e.getMessage(), e );
			throw new RuntimeException( "Excetion occurs when convert to json." );
		}
	}

	public static <T> T toBean( String jsonString, Class<T> beanClass ) {
		try {
			return MAPPER.readValue( jsonString, beanClass );
		}
		catch( Throwable e ) {
			LOGGER.error( e.getMessage(), e );
			throw new RuntimeException( "Json is invalid." );
		}
	}
}
