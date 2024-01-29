Spring Boot

Chú ý: 
	Các Bean được quản lý trong một ApplicationContext đều là Singleton:
		@Component
	Nếu muốn mỗi lần sử dụng là 1 instance hoàn toàn mới thì:
		@Component
		@Scope("prototype")
	Khi có nhiều lớp inject cho một interface:
		Sử dụng  @Primary và @Qualifier
	Kiến trúc Spring Boot:
		Sử dụng mô hình 3 lớp Controller - Service - Repository
		Controller: Handle request, Giao tiếp với môi trường bên ngoài
		Service: Xử lý nghiệp vụ, trả về kết quả cho Controller
		Repository: Giao tiếp BD, xử lý query, cung cấp dữ liệu cho Service

	Spring Boot JPA:
		Là một phần trong hệ sinh thái Spring Data, tạo ra một layer service <-> database
		Là một wrapper Hibernate với interface mạnh mẽ.

	Hibernate là gì:
		Là một thư viện ORM(Object Relational Mapping) mã nguồn mở hoạt động giống CoreData iOS.
	
	ORM(Object Relational Mapping) là gì:
		Là một kỹ thuật giúp ánh xạ các record dữ liệu từ CSDL sang dạng đối tượng và ta sẽ thao tác trên đối tượng này thay vì phải tạo các query bằng SQL xuống database.
	Explain:
		Tức là thay vì mình thực hiện 1 câu query bằng SQL xuống CSDL thì ta sẽ thực hiện nó thông qua một các object đã được ánh xạ. 
	Pros and Cons
		Không cần biết SQL, Sửa đổi model linh hoạt, tận dụng được ưu điểm của việc kế thừa dễ hơn
		Nặng hơn do sử dụng FW, bỏ time học nếu đã biết SQl, câu lệnh cũng không uyển chuyển bằng
	
	Pojo (plain old Java object):
		Một object Java thuần tuý được tạo nên từ một số quy định như:
			Phải có method getter và setter được public
			Các properties phải được private.

Terms	Responsibility
@SpringBootApplication	Xác định main class khởi chạy.  
SpringApplication.run(App.class, args);	Chạy App class trong hàm main với input là args
ApplicationContext	つまり application instance
Bean	つまり dependency class
@Component	Đánh dấu trên Class là một Bean. Việc này chỉ mang mục đích đánh dấu lại nơi có một Bean.
@Autowired	Đánh dấu việc init đối tượng sẽ do container đảm nhiệm.
@Scope("prototype")	Đánh dấu instance được tạo ra không phải là một Singleton
ApplicationContext. getBean	Đây là hàm thực hiện việc inject một đối tượng từ một interface.
@Primary	Đánh dấu lớp có độ ưu tiên sẽ được thực hiện
@Qualifier	Đặt định danh cho Lớp để container có thể hiểu được interface sẽ cần implementation nào.
@PostConstruct	Được đánh dấu trên một method duy nhất bên trong Bean, thực thi khi đối tượng được tạo ra (だいたい BeanDidLoad).
@PreDestroy	Được đánh dấu trên một method duy nhất bên trong Bean, thực thi khi đối tượng sắp bị huỷ (だいたい BeanDeinit).
@Controller(is @Component)	ĐÁNH DẤU một Class là tầng Controller.
@Service(is @Component)	ĐÁNH DẤU một Class là tầng Service.
@Repository(is @Component)	ĐÁNH DẤU một Class là tầng Repository.
@Configuration(is @Component)	Đánh dấu 1 một class giúp SpringBoot nhận biết đây là nơi định nghĩa các Bean.
@Bean(<name>)
	Đánh dấu trên các method biết được đây là 1 Bean với định danh là <name> nẳm trong class @Configuration.
resources/applications.properties	Nơi chứa thông tin cấu hình mặc định
logging.level.root=DEBUG	Chuyển sang mode debug để lấy log chi tiết
@Value(${<key>})	Sử dụng phía trên thuộc tính để lấy thông tin value từ <key> có trong file applications.properties
Template Engine	sử dụng thư viện spring-boot-starter-thymeleaf
Model	// Model là một object của Spring Boot, được gắn vào trong mọi request.
// Là một cách gọi khác của app instance(Context) sử dụng trong Thymeleaf.
${...}	Variables expressions Lấy giá trị trong Model
*{...}	Variables expressions on selections(Dấu * còn được gọi là asterisk syntax) Lấy giá trị cục bộ trong phạm vi biến cho trước
#{…}	Message expression Sử dụng để multiple languages (cấu hình trong các file .properties)
@{…}	URL expression Xử lý URL
@PostMapping, @GetMapping, @PutMapping, @DeleteMapping.	Đánh dấu các hàm xử lý các hàm GET, POST, PUT, DELETE request trong Controller. Khuyến khích xử dụng cho method để làm rõ ngữ nghĩa.
@RequestMapping	Map request (xử dụng với class hoặc method). Khuyến khích xử dụng cho class để làm rõ ngữ nghĩa.
@Entity
	Đánh dấu đây là 1 entity(thực thể) chịu sự quản lý của Hibernate
@Table(name = "USER")	Đánh dấu entity này đại diện cho quan hệ USER
@Data
	Tự động tạo ra các getter và setter (từ việc sử dụng framework Lombok).
@GeneratedValue(strategy = GenerationType.IDENTITY)
, @Column(name = "hp”), @Id	Các từ khoá dùng cho define trong 1 entity
JpaRepository<User, Long>	Tạo ra một repository truy xuất lớp thực thể Hibernate ở mức highlevel bằng các truy vấn tiện lợi hơn. Interface này cần 2 thông tin là (Entity và Kiểu dữ liệu khoá chính). Ví dụ ở đây là thực thể User và primary key type là Long
@Query(“<JPQL / SQL thuần>”)	Được sử dụng trên 1 method nằm bên trong interface mở rộng JpaRepository để cung cấp thêm một truy vấn uyển chuyển hơn nếu những truy vấn hiện tại không đủ để sử dụng. 
@Controller	Trả về một Template
@RestController	Trả về dữ liệu dưới dạng JSON (Là kết quả của combine @Controller và @RequestBody)

