package com.gzm.xm.common.entity;

import java.io.Serializable;

public abstract class AbstractEntity  implements Serializable{
	
	public abstract Object getId();

	@Override
	public int hashCode() {
		return getId() == null ? 0: getId().hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		
		if( this == obj )
			return true;
		if( obj == null || getClass() != obj.getClass() )
			return false;
		return getId() == null ? false : getId().equals( ( ( AbstractEntity ) obj ).getId());
		
	}

	public String getName(){
        return "";
    }

    public String getPicUrl(){
        return "";
    }

}
