import UIKit
import AVFoundation

protocol AudioRecordDelegate: AnyObject {
    
    func didFinishRecording(_ manager: AudioRecorderManager, success: Bool)
    
    func diddFinishPlaying(_ manager: AudioRecorderManager, success: Bool)
    
}

// 音频管理
class AudioRecorderManager: NSObject {
    
    var audioRecorder: AVAudioRecorder?
    
    var audioPlayer: AVAudioPlayer?
    
    var audioFileURL: URL?
    
    weak var delegate: AudioRecordDelegate?
    
    override init() {
        super.init()
        setAudioSession()
    }
    
    // 会话
    private func setAudioSession() {
        PessionUtil.openRecordServiceWithBlock(true) { [self] isOpen in
            if isOpen {
                let audioSession = AVAudioSession.sharedInstance()
                do {
                    try audioSession.setCategory(.playAndRecord, mode: .default, options: .defaultToSpeaker)
                    try audioSession.setActive(true)
                    
                    audioFileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("recording.m4a")
                } catch {
                    print("音频设置会话失败:\(error.localizedDescription)")
                }
            } else {
                print("用户未打开权限")
            }
        }
    }
    
    // 开始录音
    func startRecording() {
        guard let audioFileURL = self.audioFileURL else { return }
        
        // 配置
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC), // m4a格式 指定
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue // 高音质
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFileURL, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.record()
        } catch {
            print("录音初始化失败:\(error.localizedDescription)")
        }
    }
    
    // 停止录音
    func stopRecord() {
        audioRecorder?.stop()
        audioRecorder = nil
    }
    
    // 播放音频
    func playAudio() {
        guard let audioFileURL = self.audioFileURL else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
            audioPlayer?.delegate = self
            if audioPlayer!.isPlaying {
                audioPlayer?.pause()
            } else {
                audioPlayer?.play()
            }
        } catch {
            print("播放音频失败:\(error.localizedDescription)")
        }
    }
    
    // 移除录音文件
    func removeFile() {
        guard let audioFileURL = self.audioFileURL else { return }
        
        do {
            try FileManager.default.removeItem(at: audioFileURL)
        } catch {
            print("删除文件失败:\(error.localizedDescription)")
        }
    }

    // 获取音频时长
    func getAudioDuration(url: URL) async -> Double? {
        let asset = AVAsset(url: url)
        
        do {
            // 使用 load(.duration) 异步加载时长
            let duration: CMTime = try await asset.load(.duration)
            
            // 获取时长并返回
            let seconds = CMTimeGetSeconds(duration)
            return seconds.isFinite ? seconds : nil
        } catch {
            // 出现异常时返回 nil
            return nil
        }
    }
}

extension AudioRecorderManager: AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        delegate?.didFinishRecording(self, success: flag)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        delegate?.diddFinishPlaying(self, success: flag)
    }
    
}
