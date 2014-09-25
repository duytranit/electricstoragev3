# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.delete_all
Procategory.delete_all
User.delete_all

staff = User.create(
    email: 'nhanvien1@gmail.com',
    role: 'staff',
    password: '123123123'
)

customer = User.create(
    email: 'khachhang1@gmail.com',
    role: 'customer',
    password: '123123123'
)

Procategory.create(
		name: 'Tin học, thông tin & tác phẩm tổng quát',
		ddc: '000',
		status: true
)
Procategory.create(
		name: 'Triết học & Tâm lý học',
		ddc: '100',
		status: true
)
Procategory.create(
		name: 'Tôn giáo',
		ddc: '200',
		status: true
)
Procategory.create(
		name: 'Khoa học xã hội',
		ddc: '300',
		status: true
)
Procategory.create(
		name: 'Ngôn ngữ',
		ddc: '400',
		status: true
)
Procategory.create(
		name: 'Khoa học',
		ddc: '500',
		status: true
)
Procategory.create(
		name: 'Công nghệ',
		ddc: '600',
		status: true
)
Procategory.create(
		name: 'Nghệ thuật & vui chơi giải trí',
		ddc: '700',
		status: true
)
Procategory.create(
		name: 'Văn học',
		ddc: '800',
		status: true
)
Procategory.create(
		name: 'Lịch sử & địa lý',
		ddc: '900',
		status: true
)
Procategory.create(
		name: 'Đời sống trí tuệ',
    ddc: '001.1',
    status: true
)
Procategory.create(
		name: 'Học vấn và học tập',
    ddc: '001.2',
    status: true
)
Procategory.create(
		name: 'Khoa học nhân văn',
    ddc: '001.3',
    status: true
)
Procategory.create(
		name: 'Nghiên cứu; phương pháp thống kê',
    ddc: '001.4',
    status: true
)
Procategory.create(
		name: 'Tri thức còn tranh luận',
    ddc: '001.9',
    status: true
)
Procategory.create(
		name: 'Tri thức',
    ddc: '001',
    description: 'Bao gồm cả lịch sử, mô tả, đánh giá phê phán hoạt động trí tuệ nói chung; gia tăng, biến đổi
thông tin và kiến thức; tác phẩm liên ngành về người tư vấn. Xếp vào đây bàn luận về các ý tưởng trong nhiều
lĩnh vực. Xếp tri thức luận vào 121. Xếp biên tập kiến thức dưới một hình thức cụ thể theo hình thức đó, vd.,
bách khoa thư 030. Về người tư vấn hoặc sử dụng người tư vấn trong một chủ đề cụ thể, xem chủ đề đó, vd.,
dịch vụ tư vấn y học 362.17, sử dụng người tư vấn trong quản lý 658.4. Xem phần hướng dẫn ở 500 so với 001',
    status: true
)
Procategory.create(
		name: 'Sách',
    ddc: '002',
    status: true
)
Procategory.create(
		name: 'Hệ thống',
		ddc: '003',
		status: true
)
Procategory.create(
		name: 'Xử lý dữ liệu - Tin học',
		ddc: '004',
		status: true
)
Procategory.create(
		name: 'Lập trình máy tính, chương trình, dữ liệu',
		ddc: '005',
		status: true
)
Procategory.create(
		name: 'Các phương pháp tin học đặc biệt',
		ddc: '006',
		status: true
)
Procategory.create(
		name: 'Thư mục học',
		ddc: '010',
		description: 'Lịch sử, nhận dạng, mô tả các tài liệu in, viết, nghe nhin, điện tử.
Bao gồm cả việc chuẩn bị và biên soạn thư mục. Xếp biên mục mô tả vào 025.3.
Xếp chuẩn bị và biên soạn một loại thư mục cụ thể vào loại đó, cộng thêm ký hiệu 028 từ Bảng 1,
vd., chuẩn bị và biên soạn các thư mục tiểu sử 012.028; xếp mục lục và danh mục các tác phẩm nghệ thuật
theo chủ đề, cộng thêm ký hiệu 074 từ Bảng 1, vd., mục lục tài liệu in 769.074.
Về thư mục lịch sử, xem 002. Xem thêm 028.1 về tài liệu tổng quan.',
		status: true
)
Procategory.create(
		name: 'Thư viện học & Thông tin học',
		ddc: '020',
		description: '',
		status: true
)
# Procategory.create(
# 		name: 'Bách khoa thư & sách sự kiện',
# 		ddc: '030',
# 		status: true
# )
Procategory.create(
		name: 'Không phân định',
		ddc: '040',
		status: true
)
Procategory.create(
		name: 'Tạp chí, báo & xuất bản phẩm nhiều kỳ',
		ddc: '050',
		status: true
)
# Procategory.create(
# 		name: 'Các hiệp hội, tổ chức & bảo tàng',
# 		ddc: '060',
# 		status: true
# )
Procategory.create(
		name: 'Truyền thông tin tức, nghề làm báo & xuất bản',
		ddc: '070',
		status: true
)
Procategory.create(
		name: 'Trích dẫn',
		ddc: '080',
		status: true
)
# Procategory.create(
# 		name: 'Bản viết tay & sách quý hiếm',
# 		ddc: '090',
# 		status: true
# )
Procategory.create(
		name: 'Siêu hình học',
		ddc: '110',
		status: true
)
Procategory.create(
		name: 'Tri thức luận',
		ddc: '120',
		status: true
)
Procategory.create(
		name: 'Cận tâm lý học & thuyết huyền bí',
		ddc: '130',
		status: true
)
Procategory.create(
		name: 'Các trường phái tư tưởng triết học',
		ddc: '140',
		status: true
)
Procategory.create(
		name: 'Tâm lý học',
		ddc: '150',
		status: true
)
Procategory.create(
		name: 'Logic học',
		ddc: '160',
		status: true
)
Procategory.create(
		name: 'Đạo dức học',
		ddc: '170',
		status: true
)
Procategory.create(
		name: 'Triết học cổ đại, trung cổ & triết học Phương Đông',
		ddc: '180',
		status: true
)
Procategory.create(
		name: 'Triết học Phương Tây hiện đại',
		ddc: '190',
		status: true
)
Procategory.create(
		name: 'Triết học & giáo lý',
		ddc: '210',
		status: true
)
Procategory.create(
		name: 'Kinh thánh',
		ddc: '220',
		status: true
)
Procategory.create(
		name: 'Thiên chúa giáo & Thần học Thiên chúa giáo',
		ddc: '230',
		status: true
)
Procategory.create(
		name: 'Hành đạo & nghi lễ Thiên chúa giáo',
		ddc: '240',
		status: true
)
Procategory.create(
		name: 'Sự hành đạo của giáo sỹ Thiên chúa giáo & dòng tu tôn giáo',
		ddc: '250',
		status: true
)
Procategory.create(
		name: 'Tổ chức Thiên chúa giáo, công việc xã hội & thờ phụng',
		ddc: '260',
		status: true
)
Procategory.create(
		name: 'Lịch sử Thiên chúa giáo',
		ddc: '270',
		status: true
)
Procategory.create(
		name: 'Các giáo phái Thiên chúa giáo',
		ddc: '280',
		status: true
)
Procategory.create(
		name: 'Tôn giáo khác',
		ddc: '290',
		status: true
)
Procategory.create(
		name: 'Khoa học thống kê',
		ddc: '310',
		status: true
)
Procategory.create(
		name: 'Khoa học chính trị',
		ddc: '320',
		status: true
)
Procategory.create(
		name: 'Kinh tế học',
		ddc: '330',
		status: true
)
Procategory.create(
		name: 'Luật pháp',
		ddc: '340',
		status: true
)
Procategory.create(
		name: 'Hành chính công & khoa học quân sự',
		ddc: '350',
		status: true
)
Procategory.create(
		name: 'Các vấn đề xã hội & dịch vụ xã hội',
		ddc: '360',
		status: true
)
Procategory.create(
		name: 'Giáo dục',
		ddc: '370',
		status: true
)
Procategory.create(
		name: 'Thương mại, các phương tiện truyền thống (liên lạc) & giao thông vận tải',
		ddc: '380',
		status: true
)
Procategory.create(
		name: 'Phong tục, nghi lễ & văn hóa dân gian',
		ddc: '390',
		status: true
)
Procategory.create(
		name: 'Ngôn ngữ học',
		ddc: '410',
		status: true
)
Procategory.create(
		name: 'Tiếng Anh & ngôn ngữ Anh cổ',
		ddc: '420',
		status: true
)
Procategory.create(
		name: 'Tiếng Đức & các ngôn ngữ liên quan',
		ddc: '430',
		status: true
)
Procategory.create(
		name: 'Tiếng Pháp & các ngôn ngữ liên quan',
		ddc: '440',
		status: true
)
Procategory.create(
		name: 'Tiếng Italia, Rumani & các ngôn ngữ liên quan',
		ddc: '450',
		status: true
)
Procategory.create(
		name: 'Tiếng Tây Ban Nha & Bồ Đào Nha',
		ddc: '460',
		status: true
)
Procategory.create(
		name: 'Tiếng Latin & ngôn gnwx Italia cổ',
		ddc: '470',
		status: true
)
Procategory.create(
		name: 'Tiếng Hy lạp cổ diển & hiện đại',
		ddc: '480',
		status: true
)
Procategory.create(
		name: 'Các ngôn ngữ khác',
		ddc: '490',
		status: true
)
Procategory.create(
		name: 'Toán học',
		ddc: '510',
		status: true
)
Procategory.create(
		name: 'Thiên văn học',
		ddc: '520',
		status: true
)
Procategory.create(
		name: 'Vật lý học',
		ddc: '530',
		status: true
)
Procategory.create(
		name: 'Hóa học',
		ddc: '540',
		status: true
)
Procategory.create(
		name: 'Khoa học về trái đất & địa chất học',
		ddc: '550',
		status: true
)
Procategory.create(
		name: 'Sinh vật hóa thạch & đời sống thời tiền sử',
		ddc: '560',
		status: true
)
Procategory.create(
		name: 'Khoa học về sự sống; Sinh vật học',
		ddc: '570',
		status: true
)
Procategory.create(
		name: 'Thực vật (Thực vật học)',
		ddc: '580',
		status: true
)
Procategory.create(
		name: 'Động vật (Động vật học)',
		ddc: '590',
		status: true
)
Procategory.create(
		name: 'Y học & Sức khỏe',
		ddc: '610',
		status: true
)
Procategory.create(
		name: 'Kỹ thuật',
		ddc: '620',
		status: true
)
Procategory.create(
		name: 'Nông nghiệp',
		ddc: '630',
		status: true
)
Procategory.create(
		name: 'Quản lý nhà cửa & gia đình',
		ddc: '640',
		status: true
)
Procategory.create(
		name: 'Quản lý & quan hệ công cộng',
		ddc: '650',
		status: true
)
Procategory.create(
		name: 'Kỹ thuật hóa học',
		ddc: '660',
		status: true
)
Procategory.create(
		name: 'Công nghệ sản xuất',
		ddc: '670',
		status: true
)
Procategory.create(
		name: 'Sản xuất chuyên dụng',
		ddc: '680',
		status: true
)
Procategory.create(
		name: 'Nhà & xây dựng',
		ddc: '690',
		status: true
)
Procategory.create(
		name: 'Quy hoạch cảnh quan & quy hoạch vùng',
		ddc: '710',
		status: true
)
Procategory.create(
		name: 'Kiến trúc',
		ddc: '720',
		status: true
)
Procategory.create(
		name: 'Nghệ thuật điêu khắc, gốm & gia công kim loại',
		ddc: '730',
		status: true
)
Procategory.create(
		name: 'Vẽ & nghệ thuật trang trí',
		ddc: '740',
		status: true
)
Procategory.create(
		name: 'Hội họa',
		ddc: '750',
		status: true
)
Procategory.create(
		name: 'Nghệ thuật đồ họa',
		ddc: '760',
		status: true
)
Procategory.create(
		name: 'Nhíp ảnh & nghệ thuật máy tính',
		ddc: '770',
		status: true
)
Procategory.create(
		name: 'Âm nhạc',
		ddc: '780',
		status: true
)
Procategory.create(
		name: 'Thể thao, trò chơi & biểu diễn',
		ddc: '790',
		status: true
)
Procategory.create(
		name: 'Văn học Mỹ bằng tiếng Anh',
		ddc: '810',
		status: true
)
Procategory.create(
		name: 'Văn học Anh & văn học Anh cổ',
		ddc: '820',
		status: true
)
Procategory.create(
		name: 'Văn học Đức & văn học liên quan',
		ddc: '830',
		status: true
)
Procategory.create(
		name: 'Văn học Pháp & văn học liên quan',
		ddc: '840',
		status: true
)
Procategory.create(
		name: 'Văn học Italia, Rumani & văn học liên quan',
		ddc: '850',
		status: true
)
Procategory.create(
		name: 'Văn hoc Tây Ban Nha & Bồ Đào Nha',
		ddc: '860',
		status: true
)
Procategory.create(
		name: 'Văn học Latinh & Văn học Italia cổ',
		ddc: '870',
		status: true
)
Procategory.create(
		name: 'Văn học Hy Lạp cổ điển & hiện đại',
		ddc: '880',
		status: true
)
Procategory.create(
		name: 'Các nền văn học khác',
		ddc: '890',
		status: true
)
Procategory.create(
		name: 'Địa lý & du hành',
		ddc: '910',
		status: true
)
Procategory.create(
		name: 'Tiểu sử & phả hệ học',
		ddc: '920',
		status: true
)
Procategory.create(
		name: 'Lịch sử thế giới cổ đại (cho tới khoảng năm 499)',
		ddc: '930',
		status: true
)
Procategory.create(
		name: 'Lịch sử Châu Âu',
		ddc: '940',
		status: true
)
Procategory.create(
		name: 'Lịch sử Châu Á',
		ddc: '950',
		status: true
)
Procategory.create(
		name: 'Lịch sử Châu Phi',
		ddc: '960',
		status: true
)
Procategory.create(
		name: 'Lịch sử Bắc Mỹ',
		ddc: '970',
		status: true
)
Procategory.create(
		name: 'Lịch sử Nam Mỹ',
		ddc: '980',
		status: true
)
Procategory.create(
		name: 'Lịch sử các khu vực khác',
		ddc: '990',
		status: true
)