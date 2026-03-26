import 'package:screencrafter_app/utils/colors.dart'; 
import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Balance'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildBalanceSection(),
          _buildUncategorizedBanner(),
          _buildDateSection('Monday 4 December 2025'),
          _buildTransactionCard(
            title: 'Accommodation at Guest Houses or ...',
            amount: '-1000',
            category: 'Travel Expense',
            vat: '5%',
            isExpense: true,
          ),
          _buildDateSection('Saturday 1 December 2025'),
          _buildTransactionCard(
            title: 'STRIPE',
            amount: '+54.99',
            category: 'Travel Expense',
            vat: '5%',
            isExpense: false,
            showBreakdown: true,
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFE0F7F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'April 2025',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _buildDateSection('Monday 4 December 2025'),
          _buildTransactionCard(
            title: 'Accommodation at Guest Houses or ...',
            amount: '-1000',
            category: 'Travel Expense',
            vat: '5%',
            isExpense: true,
          ),
          const SizedBox(height: 80),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBalanceSection() {
    return Column(
      children: [
        Text('15,352.24 AED', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('All my Accounts', style: TextStyle(color: AppColors.primaryColor)),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ],
    );
  }

  Widget _buildUncategorizedBanner() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: const Center(child: Text('2', style: TextStyle(color: Colors.white))),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Transactions are Uncategorized'),
              Text('Categorize these transactions', style: TextStyle(color: AppColors.primaryColor)),
            ],
          ),
          const Spacer(),
          Image.network('https://example.com/character.png', width: 64),
        ],
      ),
    );
  }

  Widget _buildDateSection(String date) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16),
      child: Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTransactionCard({
    required String title,
    required String amount,
    required String category,
    required String vat,
    required bool isExpense,
    bool showBreakdown = false,
  }) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.attach_file),
              const SizedBox(width: 12),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(amount,
                  style: TextStyle(
                    color: isExpense ? AppColors.errorColor : AppColors.successColor,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.pinkColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(category),
              const Spacer(),
              Text('VAT'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Text('5%'),
                    Icon(Icons.arrow_drop_down, size: 16),
                  ],
                ),
              ),
            ],
          ),
          if (showBreakdown) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Close Breakdowns', textAlign: TextAlign.center),
            ),
            const SizedBox(height: 12),
            _buildBreakdownRow('Travel Expense', '+540000.99', true),
            _buildBreakdownRow('Discount', '-540000.99', false),
          ],
        ],
      ),
    );
  }

  Widget _buildBreakdownRow(String label, String amount, bool isIncome) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: isIncome ? AppColors.pinkColor : AppColors.greenColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(label),
        const Spacer(),
        Text(amount,
            style: TextStyle(
              color: isIncome ? AppColors.successColor : AppColors.errorColor,
            )),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavButton(Icons.list, 'Management'),
          _buildNavButton(Icons.swap_horiz, 'Transactions', isActive: true),
          _buildNavButton(Icons.diamond, 'Pro Account'),
          _buildNavButton(Icons.description, 'Invoicing'),
          _buildNavButton(Icons.more_horiz, 'More'),
        ],
      ),
    );
  }

  Widget _buildNavButton(IconData icon, String label, {bool isActive = false}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? AppColors.primaryColor : null,
          ),
          child: Icon(icon, color: isActive ? Colors.white : Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: isActive ? AppColors.primaryColor : Colors.grey)),
      ],
    );
  }
}