package logic;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

public class User {
	@NotEmpty(message="ID를 입력해 주세요")
	private String id;
	@NotEmpty(message="비밀번호를 입력해 주세요")
	private String password;
	@NotEmpty(message="이름을 입력해 주세요")
	private String name;
	@NotNull(message="생년월일을 입력해 주세요")
	@Past(message="생년월일은 과거 날짜만 가능합니다")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	@NotEmpty(message="연락처를 입력해 주세요")
	private String tel;
	@NotEmpty(message="이메일을 입력해 주세요")
	private String email;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", name=" + name + ", birthday=" + birthday + ", tel="
				+ tel + ", email=" + email + "]";
	}
}
