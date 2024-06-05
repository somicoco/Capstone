import 'dart:convert';
import 'dart:io';
import 'package:circlet/components/components.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class StudyChatPage extends StatefulWidget {
  StudyInfo studyInfo;

  StudyChatPage({required this.studyInfo});

  @override
  State<StudyChatPage> createState() => _StudyChatPageState();
}

class _StudyChatPageState extends State<StudyChatPage> {
  List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
    firstName: 'User',
    lastName: 'Name',
  );

  // 다른 사용자
  final _otherUser = const types.User(
    id: '12345678-1234-1234-1234-123456789012',
    firstName: '마이콜',
    lastName: '',
  );

  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadMessages();
    _otherMessage();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _otherMessage() {
    final initialMessage = types.TextMessage(
      author: _otherUser,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: '안녕하세요',
    );

    _addMessage(initialMessage);
  }

  DateTime _getKoreanTime() {
    final now = DateTime.now().toUtc();
    return now.add(Duration(hours: 9));
  }

  String _formatDateTime(DateTime dateTime) {
    final formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    final weekDay = DateFormat('EEEE').format(dateTime);
    return '$formattedDate $weekDay';
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: _getKoreanTime().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: _getKoreanTime().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
          _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
          (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
          _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
          (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
      types.TextMessage message,
      types.PreviewData previewData,
      ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final fixedDateTime = DateTime.now().add(Duration(hours: 9));
    final DateFormat formatter = DateFormat('yyyy년 M월 d일 a h:mm', 'ko_KR');
    final formattedDate = formatter.format(fixedDateTime);
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: fixedDateTime.millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _handleSendButtonPressed() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      _handleSendPressed(types.PartialText(text: text));
      _textController.clear();
    }
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }

  bool _isMessageFromOtherUser(types.Message message) {
    return message.author.id != _user.id;
  }

  Widget _avatarBuilder(types.User user) {
    final imageName = user.id == _user.id ? 'assets/image/example/ddochi.png' : 'assets/image/example/Michael.png'; // 나중에 유저에게 등록되어있는 이미지를 가져와야하는듯

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imageName,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _customMessageBuilder(
      types.Message message, {
        required int messageWidth,
      }) {
    final types.User author = message.author;
    final bool isCurrentUser = author.id == _user.id;
    final CrossAxisAlignment alignment = isCurrentUser
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start;
    final Color textColor = isCurrentUser ? Colors.black : Colors.black;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            author.firstName ?? author.id,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: isCurrentUser ? Color(0xffEFEFEF) : Color(0xffEFEFEF),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            message is types.TextMessage ? message.text : 'Unsupported message',
            style: TextStyle(color: textColor),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Chat(
      messages: _messages,
      onAttachmentPressed: _handleAttachmentPressed,
      onMessageTap: _handleMessageTap,
      onPreviewDataFetched: _handlePreviewDataFetched,
      onSendPressed: _handleSendPressed,
      showUserAvatars: true,
      showUserNames: true, 
      user: _user,
      inputOptions: InputOptions(
        sendButtonVisibilityMode: SendButtonVisibilityMode.always,
      ),
      theme: DefaultChatTheme(
        primaryColor: Color(0xffEFEFEF),
        secondaryColor: Color(0xffEFEFEF),
        inputBackgroundColor: Color(0xffF2F2F2),
        messageInsetsVertical: 8,
        messageInsetsHorizontal: 16,
        sentMessageBodyTextStyle: TextStyle(color: Colors.black),
        receivedMessageBodyTextStyle: TextStyle(color: Colors.black),
        userAvatarNameColors: [Colors.black]
      ),
      emptyState: Center(
        child: Text(''),
      ),
      avatarBuilder: _avatarBuilder,
      customBottomWidget: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Color(0xffEBEBEB),
          ),
          Container(
            padding: EdgeInsets.only(left: 13, top: 13, bottom: 13),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffF2F2F2),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.photo),
                        onPressed: _handleImageSelection,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          decoration: InputDecoration(
                            hintText: '메시지 보내기',
                            hintStyle: TextStyle(
                              color: Color(0xff838383),
                              fontFamily: 'NotoSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: GestureDetector(
                    child: SvgPicture.asset('assets/icon/send.svg'),
                    onTap: _handleSendButtonPressed,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      customMessageBuilder: _customMessageBuilder, // 커스텀 메시지 빌더 추가
    ),
  );
}
